-- inspired by nyoom.nvim and https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
local function get_file_name()
	return ((vim.fn.expand("%") == "") and " [Empty] ") or (" " .. vim.fn.expand("%:t") .. " ")
end

local options = {
	packer = {
		"kyazdani42/nvim-web-devicons",
	},
	data = function()
		return {
			modes = {
				n = "RW",
				no = "RO",
				v = "**",
				V = "**",
				["\022"] = "**",
				s = "S",
				S = "SL",
				["\019"] = "SB",
				i = "**",
				ic = "**",
				R = "R",
				Rv = "RV",
				c = "VIEX",
				cv = "VIEX",
				ce = "EX",
				r = "r",
				rm = "r",
				["r?"] = "r",
				["!"] = "!",
				t = "",
			},
			mode_colors = {
				n = "%#StatusNormal#",
				i = "%#StatusInsert#",
				ic = "%#StatusInsert#",
				v = "%#StatusVisual#",
				V = "%#StatusVisual#",
				["\022"] = "%#StatusVisual#",
				R = "%#StatusReplace#",
				c = "%#StatusCommand#",
				t = "%#StatusTerminal#",
			},
			get_file_type = function()
				local file_type = vim.bo.filetype
				return ("%%#NormalNC# %s %s"):format(
					require("nvim-web-devicons").get_icon(get_file_name(), file_type, { default = true }),
					file_type
				)
			end,
			get_bufnr = function()
				return "%#Comment##" .. vim.api.nvim_get_current_buf()
			end,
			get_file_info = function()
				return "%#Normal#" .. get_file_name()
			end,
			get_git_status = function()
				local branch = vim.b.gitsigns_status_dict or { head = "" }
				local is_empty = branch.head == ""
				if not is_empty then
					return "%#NormalNC#" .. string.format("( • #%s) ", branch.head)
				end
				return ""
			end,
			get_lsp_diagnostic = function()
				local get = function(type)
					local ok, res = pcall(vim.diagnostic.get, 0, { severity = type })
					if ok then
						return #res
					end
					return 0
				end
				return ("%%#StatusLineDiagnosticWarn#%s %%#StatusLineDiagnosticError#%s"):format(
					get(vim.diagnostic.severity.WARN) or 0,
					get(vim.diagnostic.severity.ERROR) or 0
				)
			end,
			get_search_count = function()
				if vim.v.hlsearch == 0 then
					return "%#Normal# %l:%c "
				end
				local ok, count = pcall(vim.fn.searchcount, { recompute = true })
				if (not ok or (count.current == nil)) or count.total == 0 then
					return ""
				end
				if count.incomplete == 1 then
					return "?/?"
				end
				local too_many = (">%d"):format(count.maxcount)
				local total = (((count.total > count.maxcount) and too_many) or count.total)
				return ("%#Normal#" .. (" %s matches "):format(total))
			end,
			mode_color = function(colors)
				local mode = vim.api.nvim_get_mode().mode
				local mode_color = colors[mode]
				if not mode_color then
					mode_color = "%#Normal#"
				end
				return mode_color
			end,
		}
	end,
	exec = function(root)
		vim.opt.laststatus = 3
		local status_line = table.concat({
			root.mode_color(root.mode_colors),
			string.format(" %s ", root.modes[vim.api.nvim_get_mode().mode]):upper(),
			root.get_file_info(),
			root.get_git_status(),
			root.get_bufnr(),
			"%=",
			root.get_lsp_diagnostic(),
			root.get_file_type(),
			root.get_search_count(),
		})
		local winbar = "%#Comment#"
		if vim.bo.modified then
			winbar = winbar .. ("%s"):format(" •")
		end
		winbar = winbar .. " %f "
		return {
			status_line = status_line,
			winbar = winbar,
		}
	end,
}

local nt_view = require("nvim-tree.view")

Statusline = {
	active = function()
		local status = options.exec(options.data()).status_line
		if nt_view.is_visible() then
			return "%#NvimTreeNormal#                              " .. status
		end
		return status
	end,
	inactive = function()
		return " %F"
	end,
	short = function()
		return "  NvimTree"
	end,
}

Winbar = {
	active = function()
		return options.exec(options.data()).winbar
	end,
}

vim.api.nvim_create_augroup("statusline", { clear = true })
vim.api.nvim_create_augroup("winbar", { clear = true })

vim.api.nvim_create_autocmd(
	{ "BufEnter", "WinEnter", "BufFilePost", "BufWritePost", "CursorHold", "CursorHoldI", "FocusGained" },
	{
		group = "statusline",
		pattern = { "*" },
		callback = function()
			if _LSP_SIG_CFG.bufnr == -1 or _LSP_SIG_CFG.bufnr ~= vim.api.nvim_get_current_buf() then
				vim.api.nvim_command("setlocal statusline=%!v:lua.Statusline.active()") -- this runs faster for some reason
			end
		end,
	}
)

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = "statusline",
	pattern = { "*" },
	command = "setlocal statusline=%!v:lua.Statusline.inactive()",
})

vim.api.nvim_create_autocmd(
	{ "BufEnter", "WinEnter", "BufFilePost", "BufWritePost", "CursorHold", "CursorHoldI", "FocusGained" },
	{
		group = "winbar",
		pattern = { "*" },
		callback = function()
			if _LSP_SIG_CFG.bufnr == -1 or _LSP_SIG_CFG.bufnr ~= vim.api.nvim_get_current_buf() then
				vim.opt_local.winbar = Winbar.active()
			end
		end,
	}
)

vim.api.nvim_create_autocmd(
	{ "BufEnter", "WinEnter", "BufFilePost", "BufWritePost", "CursorHold", "CursorHoldI", "FocusGained", "FileType" },
	{
		group = "winbar",
		pattern = { "NvimTree_1" },
		command = "setlocal winbar=",
	}
)

return options
