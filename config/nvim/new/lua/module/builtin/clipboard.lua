return {
    exec = function(_)
        vim.opt.clipboard:append({ "unnamedplus" }) -- Share the clipboard between system and the editor.
    end,
}
