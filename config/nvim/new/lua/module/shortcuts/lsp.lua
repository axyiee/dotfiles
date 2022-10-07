return {
    data = function()
        return {
            on_attach = function(client, bufnr)
                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functio
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "<C-b>", vim.lsp.buf.declaration, bufopts)
                vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, bufopts)
                vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.hover, bufopts)
                vim.keymap.set("n", "<C-S-b>", vim.lsp.buf.implementation, bufopts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set("n", "<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, bufopts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
                vim.keymap.set("n", "<C-S-f>", vim.lsp.buf.references, bufopts)
                vim.keymap.set("n", "<C-S-i>", vim.lsp.buf.formatting, bufopts)
            end,
        }
    end,
    exec = function()
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
    end,
}
