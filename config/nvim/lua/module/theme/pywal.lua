return {
    packer = {
        "AlphaTechnolog/pywal.nvim",
    },
    as = "pywal",
    data = function()
        return require("pywal")
    end,
    exec = function(root)
        vim.o.termguicolors = true
	    root.setup()
    end,
}
