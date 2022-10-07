local ok, tree = pcall(require, "nvim-tree")
if not ok then
    return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
    view = {
        side = "left",
    },
    filters = {
        custom = { "^.git$" },
    },
})
