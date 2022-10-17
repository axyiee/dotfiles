return {
	packer = {
		"catppuccin/nvim",
	},
	as = "catppuccin",
	data = function()
		return {
			flavor = "latte",
			theme = require("catppuccin"),
		}
	end,
	exec = function(root)
		vim.g.catppuccin_flavour = root.flavor
		root.theme.setup()
		vim.api.nvim_command("colorscheme catppuccin")
	end,
}
