return {
    packer = {
        "jose-elias-alvarez/null-ls.nvim",
    },
    data = function()
        return require("null-ls")
    end,
    exec = function(root)
        vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]]) -- Format on save.
        root.setup({
            sources = {
                root.builtins.code_actions.eslint_d,
                root.builtins.code_actions.gitsigns,
                root.builtins.diagnostics.eslint_d,
                root.builtins.formatting.prettierd.with({
                    env = {
                        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json"),
                    },
                }),
                root.builtins.formatting.stylua,
                root.builtins.completion.spell.with({
                    filetypes = { "markdown" },
                }),
            },
        })
    end,
}
