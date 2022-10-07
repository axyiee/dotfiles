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
    "ui.fuzzy_finder",
    "ui.regex",
    "editor.lsp",
    "editor.completion",
    "editor.formatting",
    "editor.snippets",
    "editor.autopairs",
    "editor.indent",
    "editor.comment",
    "editor.colorizer",
    "editor.move",
    "editor.highlight",
    "editor.illuminate",
    "shortcuts.space_leader",
    "shortcuts.save",
    "shortcuts.quit",
    "shortcuts.comment",
    "integration.git",
    "integration.copilot",
    "integration.discord",
}

local packer = require("module.internal.packer")
local loader = require("module.internal.loader")

function M.load_all()
    local state = packer.ensure()
    packer.startup(function(use)
        for _, module in ipairs(M) do
            loader.load(use, module)
        end
        loader.after()
    end)
end

return M
