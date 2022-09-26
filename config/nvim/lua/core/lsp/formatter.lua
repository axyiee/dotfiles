local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell.with({
			filetypes = { "markdown" },
		}),
	},
})
