return {
    packer = {
        "windwp/nvim-autopairs",
        "windwp/nvim-ts-autotag",
    },
    after = {
        "nvim-treesitter",
    },
    depends = {
        "editor.highlight",
    },
    data = function()
        return require("nvim-autopairs")
    end,
    exec = function(root, treesitter)
        root.setup()
        treesitter.setup({
            autotag = {
                enable = true,
            },
        })
    end,
}
