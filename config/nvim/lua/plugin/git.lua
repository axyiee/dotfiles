local ok, git = pcall(require, "git")
if (not ok) then return end

git.setup({
    keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
        -- Open file/folder in git repository
        browse = "<Leader>go",
    }
})
