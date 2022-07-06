local ok, notify = pcall(require, 'notify');
if ok then
    vim.notify = notify
end