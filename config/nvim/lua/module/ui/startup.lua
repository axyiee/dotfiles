return {
    packer = {
        "goolord/alpha-nvim",
    },
    api = {
        "kyazdani42/nvim-web-devicons",
    },
    data = function()
        return require("alpha")
    end,
    exec = function(root)
        root.setup(require("alpha.themes.startify").config)
    end,
}
