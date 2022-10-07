return {
    data = function()
        return {
            margin_length = 2,
        }
    end,
    exec = function(root)
        vim.wo.foldcolumn = "" .. root.margin_length -- Add an extra margin to the left.
        vim.wo.signcolumn = "yes" -- Show signs in the gutter.
    end,
}
