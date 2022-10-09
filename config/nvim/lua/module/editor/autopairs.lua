return {
    packer = {
        "windwp/nvim-autopairs",
        "windwp/nvim-ts-autotag",
    },
    depends = {
        "editor.highlight",
    },
    data = function()
        return require("nvim-autopairs")
    end,
    exec = function(root, highlight)
        root.setup()
        highlight.setup({
            autotag = {
                enable = true,
            },
        })
    end,
}
