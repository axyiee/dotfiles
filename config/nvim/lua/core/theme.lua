--  ________
-- /_  __/ /  ___ __ _  ___
--  / / / _ \/ -_)  ' \/ -_)
-- /_/ /_//_/\__/_/_/_/\__/

vim.o.termguicolors = true -- Enable term gui colors in order to enable theme support.
vim.o.background = "dark"

local ok, poimandres = pcall(require, "poimandres")
if ok then
    poimandres.setup()
    vim.cmd [[ colorscheme poimandres ]]
end

local ok, lualine = pcall(require, 'lualine')
if ok then
    lualine.setup {
        options = {
            theme = 'poimandres',
            section_separators = '', component_separators = '',
            always_divide_middle = true,
            disabled_filetypes = { 'NvimTree', 'packer' }
        }
    }
end

vim.cmd [[ hi! EndOfBuffer ctermbg=0 ctermfg=0 guibg=0 guifg=0 ]]
