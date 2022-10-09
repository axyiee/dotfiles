return {
    exec = function(_)
        vim.cmd([[ set undofile ]]) -- Keep the undo/redo history between sessions.
    end,
}
