return {
    depends = {
        "api.shortcut",
    },
    exec = function(_, shortcut)
        shortcut.map_cmd("n", "<A-j>", "MoveLine(1)")
        shortcut.map_cmd("n", "<A-k>", "MoveLine(-1)")
        shortcut.map_cmd("n", "<A-h>", "MoveHChar(1)")
        shortcut.map_cmd("n", "<A-l>", "MoveHChar(-1)")
        shortcut.map_cmd("v", "<A-j>", "MoveLine(1)")
        shortcut.map_cmd("v", "<A-k>", "MoveLine(-1)")
        shortcut.map_cmd("v", "<A-h>", "MoveHChar(1)")
        shortcut.map_cmd("v", "<A-l>", "MoveHChar(-1)")
    end,
}
