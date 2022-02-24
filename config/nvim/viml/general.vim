" Save the file with super-user permissions. Really useful when
" you forget to edit the file as doas/sudo
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Add mouse support to make productivity better
set mouse=a

" Enable wild menu
set wildmenu
set wildignore=*.o,*~,*.pyc,*.class,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Always show the current position and line number
set ruler
set number

" Set the height of the Vim command line
set cmdheight=1
set hid

" Better searching
set smartcase
set hlsearch
set incsearch

" Don't redraw while executing macros for better performance
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" History and file type settings
set history=500
filetype plugin on
filetype indent on

" Automatically update files when changed outside
set autoread
au FocusGained,BufEnter * checktime

