return {
    packer = {
        "FromSyntax/oxocarbon.nvim",
    },
    branch = "fennel",
    exec = function(_)
        vim.o.termguicolors = true
        vim.api.nvim_command("set background=dark")
        vim.api.nvim_command("colorscheme oxocarbon")
    end,
}
