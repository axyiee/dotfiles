return {
	packer = {
		"akinsho/bufferline.nvim",
	},
	api = {
		"kyazdani42/nvim-web-devicons",
	},
	data = function()
		return require("bufferline")
	end,
	exec = function(root)
		root.setup({})
	end,
}
