"    _____ __      ______
"   / __(_) /__   /_  __/______ ___
"  / _// / / -_)   / / / __/ -_) -_)
" /_/ /_/_/\__/   /_/ /_/  \__/\__/

nnoremap <leader>p :NvimTreeToggle<CR>
vnoremap <leader>p :NvimTreeToggle<CR>
nnoremap <leader>P :NvimTreeToggle<CR>
vnoremap <leader>P :NvimTreeToggle<CR>

lua <<EOF
require'nvim-tree'.setup {
    view = {
        auto_resize = true,
        side = "right"
    }
}
EOF
