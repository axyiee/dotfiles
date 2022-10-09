local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd.with({
            env = {
                PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json"),
            },
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell.with({
            filetypes = { "markdown" },
        }),
    },
})
