-- List of active modules
local M = {
	"builtin.utf8",
	"builtin.line_margin",
	"builtin.line_numbers",
	"builtin.mouse",
	"builtin.clipboard",
	"builtin.persistent_history",
	"builtin.smart_search",
	"builtin.no_tilde",
	"builtin.no_cmdheight",
	"performance.lazyredraw",
	--"performance.filetype",
	"performance.impatient",
	"theme.zenbones",
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
	"editor.autopairs",
	"editor.indent",
	"editor.comment",
	"editor.colorizer",
	"editor.move",
	"editor.highlight",
	"editor.illuminate",
	"editor.centerpad",
	"language.java",
	"language.fennel",
	"shortcuts.leader",
	"shortcuts.buffer",
	"shortcuts.comment",
	"shortcuts.move",
	"shortcuts.workarounds",
	"shortcuts.indent",
	"shortcuts.fuzzy_finder",
	"shortcuts.tree",
	"shortcuts.save",
	"integration.git",
	"integration.copilot",
	"integration.discord",
}

local packer = require("module.internal.packer")
local loader = require("module.internal.loader")

function M.load_all()
	local is_bootstrap = packer.ensure()
	packer.init()
	for _, module in ipairs(M) do
		loader.load(module)
	end
	--loader.after()
end

return M
