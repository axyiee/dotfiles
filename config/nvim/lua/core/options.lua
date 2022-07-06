--     _  __             _         ____       __  _             
--    / |/ /__ ___ _  __(_)_ _    / __ \___  / /_(_)__  ___  ___
--   /    / -_) _ \ |/ / /  ' \  / /_/ / _ \/ __/ / _ \/ _ \(_-<
--  /_/|_/\__/\___/___/_/_/_/_/  \____/ .__/\__/_/\___/_//_/___/
--                                   /_/        

vim.g.did_load_filetypes = 1 -- Add support for nathom/filetype.nvim.

--- Style
-----------------------------------------------------------------------
-- Options that are usually related to editing and personal preference.

vim.o.clipboard = "unnamedplus" -- Share the clipboard between system and the editor.

-- Ignore case when searching while still being smart.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set indention style to four spaces.
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.wo.foldcolumn = "1" -- Add an extra margin to the left.
vim.cmd[[filetype plugin indent on]]

vim.o.mouse = "a" -- Enable mouse support.
vim.o.number = true -- Show numbers in line.
vim.wo.colorcolumn = "120" -- Show a column after 120-width characters.

vim.cmd[[ set undofile ]] -- Keep the undo/redo history between sessions.
vim.o.lazyredraw = true -- Don't redraw while executing macros for better performance.
vim.o.hlsearch = true -- Highlight search results.
vim.o.incsearch = true -- Incremental search support.

vim.o.visualbell = false  -- Remove some annoying sounds when typing.
vim.o.autoread = true  -- Automatically update files when they are changed on disk.
vim.o.autochdir = true -- Set directory to the current file's directory automatically.
vim.wo.fcs = 'eob: ' -- Remove tilde character from the start of the line.

vim.o.termguicolors = true -- Enable term gui colors in order to enable theme support.
vim.o.background = "dark"
vim.cmd[[colorscheme night-owl]]

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]] -- Format on save.
