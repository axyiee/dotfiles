return {
    depends = {
        "api.shortcut",
    },
    exec = function(_, shortcut)
        shortcut.map("i", "<S-Tab>", "<C-d>")
        shortcut.map("v", "<Tab>", ">gv")
        shortcut.map("v", "<S-Tab>", "<gv")
    end,
}
