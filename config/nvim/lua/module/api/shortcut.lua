local M = {}

function M.map(mode, mapping, combination, options)
    local opts = { noremap = true, silent = true }
    if options then
        opts = vim.tbl_extend("force", opts, options)
    end
    if type(combination) == "function" then
        vim.keymap.set(mode, mapping, combination, opts)
    else
        vim.api.nvim_set_keymap(mode, mapping, combination, opts)
    end
end

function M.map_cmd(mode, mapping, cmd)
    M.map(mode, mapping, "<cmd>" .. cmd .. "<cr>")
end

return {
    data = function()
        return M
    end,
}
