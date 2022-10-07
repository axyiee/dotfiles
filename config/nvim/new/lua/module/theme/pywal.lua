return {
    packer = {
        "AlphaTechnolog/pywal.nvim",
    },
    data = function()
        return "pywal"
    end,
    exec = function(root)
        root.setup()
    end,
}
