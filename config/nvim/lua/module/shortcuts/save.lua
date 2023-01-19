return {
	depends = {
		"api.shortcut",
	},
	data = function()
		return {
			save = function()
				local current_file = vim.fn.expand("%:p")
				local parent_dir = vim.fn.fnamemodify(current_file, ":h")
				vim.fn.mkdir(parent_dir, "p")
				vim.cmd("silent! write")
			end,
		}
	end,
	exec = function(_, shortcut)
		local path = "lua require('module.shortcuts.save').data().save()"
		shortcut.map_cmd("i", "<C-s>", path)
		shortcut.map_cmd("v", "<C-s>", path)
		shortcut.map_cmd("n", "<C-s>", path)
	end,
}
