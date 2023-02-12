return {
    packer = {
        "github/copilot.vim",
    },
    exec = function(_)
        vim.g.copilot_filetypes = { ["*"] = true, ["xml"] = true, ["yml"] = true, ["yaml"] = true } -- Enable copilot for all filetypes.
    end,
}
