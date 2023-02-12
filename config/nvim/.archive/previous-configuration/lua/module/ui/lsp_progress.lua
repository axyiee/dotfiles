return {
    packer = {
        "j-hui/fidget.nvim",
    },
    data = function()
        return require("fidget")
    end,
    exec = function(root)
        root.setup()
    end,
}
