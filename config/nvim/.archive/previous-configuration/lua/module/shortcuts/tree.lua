return {
    depends = {
        "api.shortcut",
    },
    exec = function(_, shortcut)
        shortcut.map_cmd("n", "<leader>t", "NvimTreeToggle")
        shortcut.map_cmd("n", "<S-Tab>", "wincmd p")
    end,
}
