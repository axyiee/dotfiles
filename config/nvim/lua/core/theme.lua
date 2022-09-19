--  ________
-- /_  __/ /  ___ __ _  ___
--  / / / _ \/ -_)  ' \/ -_)
-- /_/ /_//_/\__/_/_/_/\__/

vim.cmd [[ syntax on ]]

local ok, pywal = pcall(require, 'pywal');
if ok then
    pywal.setup()
end

local ok, lualine = pcall(require, 'lualine');
if ok then
    lualine.setup {
        options = {
            theme = 'auto'
        }
    }
end
