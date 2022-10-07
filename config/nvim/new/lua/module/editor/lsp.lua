return {
    packer = {
        "neovim/nvim-lspconfig",
        "nvim-lua/lsp-status.nvim",
        "folke/lsp-colors.nvim",
        "ray-x/lsp_signature.nvim",
    },
    data = function()
        return {
            lspconfig = require("lspconfig"),
            lsp_colors = require("lsp-colors"),
            lsp_signature = require("lsp_signature"),
        }
    end,
    depends = {
        "shortcuts.lsp",
    },
    exec = function(root, shortcuts)
        root.lsp_colors.setup({})
        root.lsp_signature.setup({
            bind = true,
            handler_opts = {
                border = "rounded",
            },
            always_trigger = false,
        })
        local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        local on_attach = shortcuts.data.on_attach
        local lsp = {
            "rust",
            "kotlin_language_server",
            "tsserver",
            "vuels",
            "cssls",
            "cssmodules_ls",
            "eslint",
            "html",
            "jsonls",
            "lua",
            "pyright",
        }
        for _, lang in ipairs(lsp) do
            local ok, module = pcall(require, "module.language." .. lsp)
            if ok then
                root.lspconfig[module.data.lsp.name].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = module.data.lsp.settings,
                })
            else
                root.lspconfig[lang].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end
        end
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
        vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert = true })
    end,
}
