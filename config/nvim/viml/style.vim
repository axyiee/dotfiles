"    ______       __
"   / __/ /___ __/ /__
"  _\ \/ __/ // / / -_)
" /___/\__/\_, /_/\__/
"         /___/

set completeopt=menu,menuone,noselect
syntax enable
set termguicolors
let g:copilot_filetypes = {
            \ '*': v:true,
            \ 'markdown': v:true,
            \ 'yaml': v:true,
            \ }

" Enable black background. You can enable it if you want by uncommenting the
" following lines.
" augroup BlackBackground
"     autocmd!
"     autocmd ColorScheme * hi Normal ctermbg=16 guibg=#000000
"                       \ | hi LineNr ctermbg=16 guibg=#000000
" augroup END

" Enable the color scheme
let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer"]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:github_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }
set background=light
colorscheme xcodelight

" Allow 4 spaces for indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set smartindent

