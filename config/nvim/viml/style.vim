"    ______       __
"   / __/ /___ __/ /__
"  _\ \/ __/ // / / -_)
" /___/\__/\_, /_/\__/
"         /___/

set completeopt=menu,menuone,noselect

" Enable black background. You can disable it if you want by commenting the
" following lines.
augroup BlackBackground
    autocmd!
    autocmd ColorScheme * hi Normal ctermbg=16 guibg=#000000
                      \ | hi LineNr ctermbg=16 guibg=#000000
augroup END

" Enable the color scheme
syntax enable
set termguicolors
let g:vscode_style = "dark"
let g:vscode_disable_nvimtree_bg = v:true 
colorscheme vscode

" Allow 4 spaces for indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set smartindent
