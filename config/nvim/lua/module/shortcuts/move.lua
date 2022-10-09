return {
    depends = {
        "api.shortcut",
    },
    exec = function(_, shortcut)
        shortcut.map_cmd("n", "<space>j", "MoveLine(1)")
        shortcut.map_cmd("n", "<space>k", "MoveLine(-1)")
        shortcut.map_cmd("n", "<space>h", "MoveHChar(1)")
        shortcut.map_cmd("n", "<space>l", "MoveHChar(-1)")
        shortcut.map_cmd("v", "<space>j", "MoveLine(1)")
        shortcut.map_cmd("v", "<space>k", "MoveLine(-1)")
        shortcut.map_cmd("v", "<space>h", "MoveHChar(1)")
        shortcut.map_cmd("v", "<space>l", "MoveHChar(-1)")
    end,
}
