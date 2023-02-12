return {
	exec = function(_)
		vim.cmd([[ set undofile ]]) -- Keep the undo/redo history between sessions.
		vim.api.nvim_create_augroup("last_session_cursor", { clear = true })
		vim.api.nvim_create_autocmd({ "BufReadPost" }, {
			group = "last_session_cursor",
			pattern = { "*" },
			command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
		})
	end,
}
