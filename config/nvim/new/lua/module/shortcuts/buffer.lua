return {
    depends = {
        "api.shortcut",
    },
    exec = function(_, shortcut)
        shortcut.map_cmd("i", "<C-s>", "update!")
        shortcut.map_cmd("v", "<C-s>", "update!")
        shortcut.map_cmd("s", "<C-s>", "update!")
        shortcut.map_cmd("n", "<A-,>", "BufferPrevious") -- Switch to the previous tab.
        shortcut.map_cmd("n", "<A-.>", "BufferNext") -- Switch to the next tab.
        for tab = 1, 9 do
            shortcut.map_cmd("n", "<A-" .. tab .. ">", "BufferGoto " .. tab) -- Switch to the tab at index n.
        end
        shortcut.map_cmd("n", "<A-0>", "BufferLast") -- Switch to the last tab.
        shortcut.map_cmd("n", "<C-x>", "BufferClose") -- Quit the current file by using the Ctrl+X.
    end,
}
