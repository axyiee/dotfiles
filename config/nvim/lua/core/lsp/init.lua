--     __                                       ____
--    / /  ___ ____  ___ ___ _____ ____ ____   / __/__ _____  _____ _______
--   / /__/ _ `/ _ \/ _ `/ // / _ `/ _ `/ -_) _\ \/ -_) __/ |/ / -_) __(_-<
--  /____/\_,_/_//_/\_, /\_,_/\_,_/\_, /\__/ /___/\__/_/  |___/\__/_/ /___/
--                 /___/          /___/

local ok, nvim_lsp = pcall(require, 'lspconfig')
if not ok then return end

require 'core.lsp.completion';

local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = require'core.keybind'.on_attach;

local modules = { "rust", "java", "tsserver", "clangd", "vuels", "cssls", "eslint", "html", "jsonls" }
for _, module in ipairs(modules) do 
    local ok, mdl = pcall(require, 'core.lsp.' .. module)
    if not ok then
        nvim_lsp[module].setup { on_attach = on_attach, capabilities = capabilities }
    else 
        mdl.setup(nvim_lsp, capabilities, on_attach)
    end
end

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGracnularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    },
    capabilities = capabilities,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert = true })

