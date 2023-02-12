return {
    depends = {
        "api.shortcut",
    },
    exec = function(_, shortcut)
        shortcut.map("n", "<leader>c", "gcc")
        shortcut.map("v", "<leader>c", "gcc")
        shortcut.map("n", "<leader>cc", "gbc")
        shortcut.map("v", "<leader>cc", "gbc")
    end,
}
