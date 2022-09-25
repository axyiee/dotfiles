local ok, tree = pcall(require, 'nvim-tree')
if not ok then return end

tree.setup {
    view = {
        side = 'left'
    },
    filters = {
        custom = { "^.git$" }
    }
}
