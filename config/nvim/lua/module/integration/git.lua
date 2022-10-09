return {
    packer = {
        "lewis6991/gitsigns.nvim",
        "tpope/vim-fugitive",
    },
    api = {
        "nvim-lua/plenary.nvim",
    },
    data = function()
        return require("gitsigns")
    end,
    exec = function(root)
        root.setup({})
    end,
}
