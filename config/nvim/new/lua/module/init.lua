-- List of active modules
local M = {
    "builtin.utf8",
    "builtin.line_margin",
    "builtin.line_numbers",
    "builtin.mouse",
    "builtin.clipboard",
    "builtin.persistent_history",
    "builtin.better_search",
    "builtin.no_tilde",
    "builtin.no_cmdheight",
    "performance.lazyredraw",
    "performance.filetype",
    "performance.impatient",
    "theme.pywal",
    "ui.startup",
    "ui.bufferline",
    "ui.statusline",
    "ui.file_tree",
    "ui.lsp_progress",
    "ui.notify",
    "editor.lsp",
    "editor.completion",
    "editor.formatting",
    "editor.snipetts",
    "editor.autopairs",
    "editor.indent",
    "editor.comment",
    "editor.colorizer",
    "editor.github_copilot",
    "shortcuts.space_leader",
    "shortcuts.save",
    "shortcuts.quit",
    "shortcuts.comment",
    "integration.git",
}

local packer = require("module.internal.packer")
local loader = require("module.internal.loader")

function M.load_all()
    local state = packer.ensure()
    packer.startup(function(use)
        for _, module in ipairs(M) do
            loader.load(use, module)
        end
        if state then
            loader.after()
        end
    end)
end

return M
