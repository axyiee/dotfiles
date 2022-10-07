return {
    packer = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
    },
    data = function()
        return {
            luasnip = {
                root = require("luasnip"),
                loaders = {
                    vscode = require("luasnip.loaders.from_vscode"),
                },
            },
        }
    end,
}
