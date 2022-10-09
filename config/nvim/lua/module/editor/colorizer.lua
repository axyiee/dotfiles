return {
    packer = {
        "NvChad/nvim-colorizer.lua",
    },
    exec = function()
        require("colorizer")
    end,
}
