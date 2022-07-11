--  ________
-- /_  __/ /  ___ __ _  ___
--  / / / _ \/ -_)  ' \/ -_)
-- /_/ /_//_/\__/_/_/_/\__/

local ok, okk = pcall(require, 'ok');
if ok then
    okk.setup {
        nvim_tree = {
            contrast = true
        }
    }
end

local ok, lualine = pcall(require, 'lualine');
if ok then
    lualine.setup {
        options = {
            theme = 'auto'
        }
    }
end
