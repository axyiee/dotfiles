return {
    depends = {
        "api.shortcut",
    },
    exec = function(_, shortcut)
        -- remap ctrl+c to esc in insert mode
        -- fixes lsp_signature.nvim
        shortcut.map("i", "<C-c>", "<Esc>")
    end,
}
