return {
    packer = {
        "andweeb/presence.nvim",
    },
    data = function()
        return require("presence")
    end,
    exec = function(root)
        root:setup({
            auto_update = true,
        })
    end,
}
