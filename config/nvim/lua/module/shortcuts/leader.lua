return {
    data = function()
        -- modes:
        -- assign_left: assign key to <Leader>
        -- assign_right: change leader key
        -- advantages of left: no timeout issue, and allow many leaders to be used
        return {
            mode = "assign_left",
            keys = {
                "<Space>",
            },
        }
    end,
    depends = {
        "api.shortcut",
    },
    exec = function(root, shortcut)
        if root.mode == "assign_right" then
            vim.g.mapleader = root.keys[1]
        elseif root.mode == "assign_left" then
            for _, key in ipairs(root.keys) do
                shortcut.map("n", key, "<Leader>")
                shortcut.map("v", key, "<Leader>")
            end
        else
            error("module.shortcut.leader: invalid mode: " .. root.mode)
        end
    end,
}
