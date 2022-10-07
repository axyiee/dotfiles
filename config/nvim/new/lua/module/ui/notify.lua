return {
    packer = {
        "rcarriga/nvim-notify",
    },
    data = function()
        return require("notify")
    end,
    exec = function(root)
        vim.notify = root
    end,
}
