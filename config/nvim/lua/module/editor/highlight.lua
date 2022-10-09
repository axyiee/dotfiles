return {
    packer = {
        "nvim-treesitter/nvim-treesitter",
    },
    data = function()
        return require("nvim-treesitter.configs")
    end,
    exec = function(root)
        root.setup({
            ensure_installed = { "lua", "python", "rust", "toml", "bash", "c", "go", "javascript", "typescript" },
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end,
}
