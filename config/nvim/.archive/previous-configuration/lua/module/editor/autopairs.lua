return {
    packer = {
        "windwp/nvim-autopairs",
        "windwp/nvim-ts-autotag",
        "mrjones2014/nvim-ts-rainbow",
    },
    depends = {
        "editor.highlight",
    },
    data = function()
        return require("nvim-autopairs")
    end,
    exec = function(root, highlight)
        root.setup()
        highlight.configs.setup({
            autotag = {
                enable = true,
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },
        })
    end,
}
