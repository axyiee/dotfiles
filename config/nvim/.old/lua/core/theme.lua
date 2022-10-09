--  ________
-- /_  __/ /  ___ __ _  ___
--  / / / _ \/ -_)  ' \/ -_)
-- /_/ /_//_/\__/_/_/_/\__/

vim.o.termguicolors = true -- Enable term gui colors in order to enable theme support.
vim.o.background = "dark"

-- vim.cmd([[ colorscheme embark ]])
local lualineTheme = "auto"
local ok, pywal = pcall(require, "pywal")
if ok then
    lualineTheme = "pywal-nvim"
    pywal.setup()
end

local ok, lualine = pcall(require, "lualine")
if ok then
    lualine.setup({
        options = {
            theme = lualineTheme,
            section_separators = "",
            component_separators = "",
            always_divide_middle = true,
            disabled_filetypes = { "NvimTree", "packer" },
        },
    })
end

vim.cmd([[ hi! EndOfBuffer ctermbg=0 ctermfg=0 guibg=0 guifg=0 ]])
