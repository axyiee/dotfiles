local shortcut = require("module.api.shortcut")

return {
    data = function()
        return {
            on_attach = function(client, bufnr)
                local options = { buffer = bufnr }
                shortcut.map("n", "<C-b>", vim.lsp.buf.declaration, options)
                shortcut.map("n", "<leader>d", vim.lsp.buf.definition, options)
                shortcut.map("n", "<leader><leader>", vim.lsp.buf.hover, options)
                shortcut.map("n", "<C-S-b>", vim.lsp.buf.implementation, options)
                shortcut.map("n", "<C-k>", vim.lsp.buf.signature_help, options)
                shortcut.map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, options)
                shortcut.map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, options)
                shortcut.map("n", "<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, options)
                shortcut.map("n", "<leader>D", vim.lsp.buf.type_definition, options)
                shortcut.map("n", "<F2>", vim.lsp.buf.rename, options)
                shortcut.map("n", "<leader>ca", vim.lsp.buf.code_action, options)
                shortcut.map("n", "<C-S-f>", vim.lsp.buf.references, options)
                shortcut.map("n", "<C-S-i>", vim.lsp.buf.formatting, options)
            end,
        }
    end,
    exec = function()
        shortcut.map("n", "<leader>e", vim.diagnostic.open_float)
        shortcut.map("n", "[d", vim.diagnostic.goto_prev)
        shortcut.map("n", "]d", vim.diagnostic.goto_next)
        shortcut.map("n", "<leader>q", vim.diagnostic.setloclist)
    end,
}
