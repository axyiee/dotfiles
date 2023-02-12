return {
    packer = {
        "numToStr/Comment.nvim",
    },
    data = function()
        return require("Comment")
    end,
    exec = function(root)
        vim.opt.formatoptions:append({ "r" }) -- Add asterisks in block comments.
        root.setup()
    end,
}
