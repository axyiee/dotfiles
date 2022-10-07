return {
    exec = function(_)
        vim.o.tabstop = 4
        vim.o.shiftwidth = 4
        vim.o.smarttab = true
        vim.o.expandtab = true
        vim.o.autoindent = true
        vim.cmd([[filetype plugin indent on]])
    end,
}
