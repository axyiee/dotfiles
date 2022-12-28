return {
    packer = {
        "mcchrish/zenbones.nvim",
    },
    api = {
        "rktjmp/lush.nvim",
    },
    exec = function()
        vim.opt.termguicolors = true
        vim.g.zenbones_darkness = "stark"
        vim.api.nvim_command("set background=dark")
        vim.api.nvim_command("colorscheme zenbones")
    end,
}
