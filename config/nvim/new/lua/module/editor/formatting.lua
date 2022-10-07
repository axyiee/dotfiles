return {
    packer = {
        "",
    },
    depends = { "editor.lsp" },
    exec = function(_)
        vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]]) -- Format on save.
    end,
}
