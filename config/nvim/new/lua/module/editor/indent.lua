return {
    packer = {
        "lukas-reineke/indent-blankline.nvim",
    },
    data = function()
        return {
            indent_blankline = require("indent_blankline"),
        }
    end,
    exec = function(root)
        vim.o.tabstop = 4
        vim.o.shiftwidth = 4
        vim.o.smarttab = true
        vim.o.expandtab = true
        vim.o.autoindent = true
        vim.cmd([[filetype plugin indent on]])
        root.indent_blankline.setup()
    end,
}
