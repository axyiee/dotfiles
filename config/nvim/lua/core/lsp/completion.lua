--   _____                __    __  _
--  / ___/__  __ _  ___  / /__ / /_(_)__  ___
-- / /__/ _ \/  ' \/ _ \/ / -_) __/ / _ \/ _ \
-- \___/\___/_/_/_/ .__/_/\__/\__/_/\___/_//_/
--               /_/

local ok, cmp = pcall(require, "cmp")
if not ok then
	return
end

local ok, lspkind = pcall(require, "lspkind")
if not ok then
	return
end

vim.opt.completeopt:append("menu")
vim.opt.completeopt:append("menuone")
vim.opt.completeopt:append("noselect")

lspkind.init({
	mode = "symbol_text",
	preset = "default",
})

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-f>"] = cmp.mapping.scroll_docs(-5),
		["<C-u>"] = cmp.mapping.scroll_docs(5),
		["<C-Space>"] = cmp.mapping.complete({ config = {} }),
		["<Esc>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })),
		["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", priority = 8 },
		{ name = "luasnip", option = { use_show_condition = false }, priority = 7 }, -- For luasnip users.
		{ name = "nvim_lua", priority = 6 },
		{ name = "path", priority = 5 },
		{ name = "buffer", priority = 4 },
		{ name = "calc", priority = 3 },
		{ name = "conjure" },
	}),
	sorting = {
		priority_weight = 1.0,
		comparators = {
			cmp.config.compare.locality,
			cmp.config.compare.recently_used,
			cmp.config.compare.score,
			cmp.config.compare.offset,
			cmp.config.compare.order,
		},
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			with_text = true,
			maxwidth = 60,
			before = function(entry, vim_item)
				local source = ({
					nvim_lsp = "",
					nvim_lua = "",
					treesitter = "",
					path = "ﱮ",
					buffer = "﬘",
					zsh = "",
					luasnip = "",
					spell = "暈",
				})[entry.source.name]
				if source then
					vim_item.menu = " " .. source
				end
				return vim_item
			end,
		}),
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
	pattern = "Cargo.toml",
	callback = function()
		cmp.setup.buffer({ sources = { { name = "crates" } } })
	end,
})

require("luasnip/loaders/from_vscode").lazy_load()
