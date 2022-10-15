return {
	packer = {
		"FromSyntax/oxocarbon.nvim",
	},
	branch = "fennel",
	exec = function(_)
		vim.o.termguicolors = true
		vim.cmd("colorscheme oxocarbon")
	end,
}
