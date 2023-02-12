return {
	packer = {
		"lewis6991/gitsigns.nvim",
		"tpope/vim-fugitive",
		"akinsho/git-conflict.nvim",
	},
	api = {
		"nvim-lua/plenary.nvim",
	},
	data = function()
		return {
			signs = require("gitsigns"),
			conflict = require("git-conflict"),
		}
	end,
	exec = function(root)
		root.signs.setup({})
		root.conflict.setup()
	end,
}
