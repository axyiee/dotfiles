return {
    data = function()
        return {
            key = ",",
        }
    end,
    depends = {
        "api.shortcut",
    },
    exec = function(root, shortcut)
        vim.g.mapleader = root.key
    end,
}
