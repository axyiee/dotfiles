local ok, lualine = pcall(require, 'lualine');
if ok then 
    lualine.setup {
        option = {
            theme = 'auto'
        }
    }
end