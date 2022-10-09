local ok, notify = pcall(require, 'notify');
if ok then
    notify.setup {
        background_colour = "#000000",
    }
    vim.notify = notify
end
