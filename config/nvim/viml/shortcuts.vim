"     ____                   _____         __
"    / __/_ ________ __ __  / __(_)__  ___/ /__ ____
"  / _// // /_ /_ // // / / _// / _ \/ _  / -_) __/
" /_/  \_,_//__/__/\_, / /_/ /_/_//_/\_,_/\__/_/
"                 /___/

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Save using Ctrl + S
noremap  <silent> <C-S>         :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Quit current file using Ctrl + X
noremap  <silent> <C-X>         :bdelete!<CR>
vnoremap <silent> <C-X>         <C-C>:bdelete!<CR>
inoremap <silent> <C-X>         <C-O>:bdelete!<CR>

" Smooth scrolling support for mouse wheel 
map <ScrollWheelUp> <C-u>
map <ScrollWheelDown> <C-d>
