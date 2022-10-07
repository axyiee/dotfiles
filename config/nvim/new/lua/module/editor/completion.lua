return {
    packer = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
    },
    after = {
        "friendly-snippets",
        "nvim-lspconfig",
    },
    depends = {
        "editor.lsp",
        "editor.snippets",
    },
    data = function()
        return require("cmp")
    end,
    exec = function(root, lsp, snippets)
        vim.opt.completeopt:append("menu")
        vim.opt.completeopt:append("menuone")
        vim.opt.completeopt:append("noselect")
        local lspkind = require("lspkind")
        lspkind.init({
            mode = "symbol_text",
            preset = "default",
        })

        root.setup({
            snippet = {
                expand = function(args)
                    snippets.luasnip.root.lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-f>"] = root.mapping.scroll_docs(-5),
                ["<C-u>"] = root.mapping.scroll_docs(5),
                ["<C-Space>"] = root.mapping.complete({ config = {} }),
                ["<Esc>"] = root.mapping.abort(),
                ["<CR>"] = root.mapping.confirm({ select = true }),
                ["<Down>"] = root.mapping(root.mapping.select_next_item({ behavior = root.SelectBehavior.Select })),
                ["<Up>"] = root.mapping(root.mapping.select_prev_item({ behavior = root.SelectBehavior.Select })),
            },
            sources = root.config.sources({
                { name = "nvim_lsp", priority = 8 },
                { name = "luasnip", option = { use_show_condition = false }, priority = 7 }, -- For luasnip users.
                { name = "nvim_lua", priority = 6 },
                { name = "path", priority = 5 },
                { name = "buffer", priority = 4 },
            }),
            sorting = {
                priority_weight = 1.0,
                comparators = {
                    root.config.compare.locality,
                    root.config.compare.recently_used,
                    root.config.compare.score,
                    root.config.compare.offset,
                    root.config.compare.order,
                },
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol",
                    with_text = true,
                    maxwidth = 60,
                    before = function(entry, vim_item)
                        local source = ({
                            nvim_lsp = "",
                            nvim_lua = "",
                            treesitter = "",
                            path = "ﱮ",
                            buffer = "﬘",
                            zsh = "",
                            luasnip = "",
                            spell = "暈",
                        })[entry.source.name]
                        if source then
                            vim_item.menu = " " .. source
                        end
                        return vim_item
                    end,
                }),
            },
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
        })

        -- Set configuration for specific filetype.
        root.setup.filetype("gitcommit", {
            sources = root.config.sources({
                { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
                { name = "buffer" },
            }),
        })

        vim.api.nvim_create_autocmd("BufRead", {
            group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
            pattern = "Cargo.toml",
            callback = function()
                root.setup.buffer({ sources = { { name = "crates" } } })
            end,
        })

        snippets.luasnip.loaders.vscode.lazy_load()
    end,
}
