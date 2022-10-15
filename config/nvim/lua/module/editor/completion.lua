return {
    packer = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    data = function()
        return {
            cmp = require("cmp"),
            luasnip = {
                root = require("luasnip"),
                loaders = {
                    vscode = require("luasnip.loaders.from_vscode"),
                },
            },
        }
    end,
    exec = function(root)
        vim.opt.completeopt:append("menu")
        vim.opt.completeopt:append("menuone")
        vim.opt.completeopt:append("noselect")
        local lspkind = require("lspkind")
        lspkind.init({
            mode = "symbol_text",
            preset = "default",
        })
        local mapping = {
            ["<Tab>"] = root.cmp.mapping(
                root.cmp.mapping.select_next_item({ behavior = root.cmp.SelectBehavior.Select })
            ),
            ["<S-Tab>"] = root.cmp.mapping(
                root.cmp.mapping.select_prev_item({ behavior = root.cmp.SelectBehavior.Select })
            ),
            ["<C-f>"] = root.cmp.mapping.scroll_docs(-5),
            ["<C-u>"] = root.cmp.mapping.scroll_docs(5),
            ["<C-Space>"] = root.cmp.mapping.complete({ config = {} }),
            ["<CR>"] = root.cmp.mapping.confirm({ select = true }),
        }
        for _, abort in ipairs({ "<Esc>", "<Up>", "<Down>" }) do
            mapping[abort] = root.cmp.mapping.abort()
        end
        root.cmp.setup({
            snippet = {
                expand = function(args)
                    root.luasnip.root.lsp_expand(args.body)
                end,
            },
            mapping = mapping,

            sources = root.cmp.config.sources({
                { name = "nvim_lsp", priority = 8 },
                { name = "luasnip", option = { use_show_condition = false }, priority = 7 }, -- For luasnip users.
                { name = "nvim_lua", priority = 6 },
                { name = "path", priority = 5 },
                { name = "buffer", priority = 4 },
            }),
            sorting = {
                priority_weight = 1.0,
                comparators = {
                    root.cmp.config.compare.locality,
                    root.cmp.config.compare.recently_used,
                    root.cmp.config.compare.score,
                    root.cmp.config.compare.offset,
                    root.cmp.config.compare.order,
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
        root.cmp.setup.filetype("gitcommit", {
            sources = root.cmp.config.sources({
                { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
                { name = "buffer" },
            }),
        })

        root.cmp.setup.cmdline(":", {
            sources = {
                { name = "cmdline" },
            },
        })
        root.cmp.setup.cmdline("/", {
            sources = {
                { name = "buffer" },
            },
        })

        vim.api.nvim_create_autocmd("BufRead", {
            group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
            pattern = "Cargo.toml",
            callback = function()
                root.cmp.setup.buffer({ sources = { { name = "crates" } } })
            end,
        })

        root.luasnip.loaders.vscode.lazy_load()
        vim.g.copilot_assume_mapped = true
    end,
}
