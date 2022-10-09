return {
    packer = {
        "nvim-lualine/lualine.nvim",
    },
    api = {
        "kyazdani42/nvim-web-devicons",
    },
    data = function()
        return require("lualine")
    end,
    exec = function(root)
        root.setup({
            options = {
                theme = "pywal-nvim",
                section_separators = "",
                component_separators = "",
                always_divide_middle = true,
                disabled_filetypes = { "NvimTree", "packer" },
            },
        })
    end,
}
