return {
    packer = {
        "lewis6991/gitsigns.nvim",
    },
    data = function()
        return require("gitsigns")
    end,
    exec = function(root)
        root.setup({})
    end,
}
