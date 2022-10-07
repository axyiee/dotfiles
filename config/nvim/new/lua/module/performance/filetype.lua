return {
    packer = {
        "nathom/filetype.nvim",
    },
    exec = function(_)
        vim.g.did_load_filetypes = 1
    end,
}
