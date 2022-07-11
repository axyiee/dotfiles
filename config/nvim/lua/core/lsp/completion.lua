--   _____                __    __  _         
--  / ___/__  __ _  ___  / /__ / /_(_)__  ___ 
-- / /__/ _ \/  ' \/ _ \/ / -_) __/ / _ \/ _ \
-- \___/\___/_/_/_/ .__/_/\__/\__/_/\___/_//_/
--               /_/               

local ok, cmp = pcall(require, "cmp")
if not ok then return end

local ok, nvim_lsp = pcall(require, 'lspconfig')
if not ok then return end

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
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
            ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
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

