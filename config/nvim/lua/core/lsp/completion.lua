--   _____                __    __  _
--  / ___/__  __ _  ___  / /__ / /_(_)__  ___
-- / /__/ _ \/  ' \/ _ \/ / -_) __/ / _ \/ _ \
-- \___/\___/_/_/_/ .__/_/\__/\__/_/\___/_//_/
--               /_/

local ok, cmp = pcall(require, "cmp")
if not ok then return end

local ok, nvim_lsp = pcall(require, 'lspconfig')
if not ok then return end

local ok, lspkind = pcall(require, 'lspkind')
if not ok then return end

vim.opt.completeopt:append('menu')
vim.opt.completeopt:append('menuone')
vim.opt.completeopt:append('noselect')

lspkind.init({
    mode = 'symbol_text',
    preset = 'default',
})

cmp.setup {
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    mapping = {
        ['<C-f>'] = cmp.mapping.scroll_docs(-5),
        ['<C-u>'] = cmp.mapping.scroll_docs(5),
        ['<C-Space>'] = cmp.mapping.complete({ config = {} }),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })),
    },
    sources = cmp.config.sources(
        {
            { name = 'path' },
            { name = 'nvim_lsp' },
            { name = 'luasnip', option = { use_show_condition = false } }, -- For luasnip users.
        },
        {
            { name = "buffer" }
        },
        {
            { name = "emoji", insert = true }
        }
    ),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            with_text = true,
            maxwidth = 50,
        })
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
}

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

require("luasnip/loaders/from_vscode").lazy_load()
