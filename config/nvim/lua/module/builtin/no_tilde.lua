return {
    exec = function(_)
        vim.cmd([[ set fillchars=fold:\ ,vert:\│,eob:\  ]]) -- Remove tilde character from the start of the line.
    end,
}
