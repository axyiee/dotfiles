--     __                                       ____
--    / /  ___ ____  ___ ___ _____ ____ ____   / __/__ _____  _____ _______
--   / /__/ _ `/ _ \/ _ `/ // / _ `/ _ `/ -_) _\ \/ -_) __/ |/ / -_) __(_-<
--  /____/\_,_/_//_/\_, /\_,_/\_,_/\_, /\__/ /___/\__/_/  |___/\__/_/ /___/
--                 /___/          /___/

-- Setup nvim-cmp.
local ok, cmp = pcall(require, "cmp")
if not ok then return end

local nvim_lsp = require 'lspconfig'

cmp.setup(
    {
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end
        },
        mapping = {
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            ["<CR>"] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources(
            {
                { name = "nvim_lsp" },
                { name = "vsnip" } -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            },
            {
                { name = "buffer" }
            },
            {
                { name = "emoji", insert = true }
            }
        )
    }
)

-- Set configuration for specific filetype.
cmp.setup.filetype(
    "gitcommit",
    {
        sources = cmp.config.sources(
            {
                { name = "cmp_git" } -- You can specify the `cmp_git` source if you were installed it.
            },
            {
                { name = "buffer" }
            }
        )
    }
)

-- Setup lspkind.
local lspkind = require 'lspkind'
lspkind.init({
    mode = 'symbol_text',
    preset = 'default',
})
cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            with_text = true,
            maxwidth = 50,
        })
    },
}

local capabilities = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = require 'core.keybind'.on_attach;

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

nvim_lsp.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert = true })
