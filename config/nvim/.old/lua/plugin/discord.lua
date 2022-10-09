local ok, discord = pcall(require, 'presence')
if not ok then return end

discord:setup {
    auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
}
