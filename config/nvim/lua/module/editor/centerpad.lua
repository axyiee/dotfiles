return {
    packer = {
        "smithbm2316/centerpad.nvim",
    },
    depends = {
        "api.shortcut",
    },
    exec = function(_, shortcuts)
        shortcuts.map_cmd("n", "<leader>z", "Centerpad")
    end,
}
