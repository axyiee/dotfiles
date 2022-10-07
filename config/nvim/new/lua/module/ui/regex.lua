return {
    packer = {
        "bennypowers/nvim-regexplainer",
    },
    api = {
        "MunifTanjim/nui.nvim",
    },
    after = {
        "nvim-lspconfig",
    },
    data = function()
        return require("regexplainer")
    end,
    exec = function(root)
        root.setup()
    end,
}
