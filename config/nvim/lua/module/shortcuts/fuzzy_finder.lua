return {
    depends = {
        "api.shortcut",
    },
    exec = function(_, shortcut)
        shortcut.map_cmd("n", "<C-o>", "Telescope find_files")
        shortcut.map_cmd("n", "<C-p>", "Telescope live_grep")
        shortcut.map_cmd("n", "<C-S-p>", "Telescope buffers")
    end,
}
