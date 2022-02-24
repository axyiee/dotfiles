"    ________      __                    __
"   / ___/ (_)__  / /  ___  ___ ________/ /
"  / /__/ / / _ \/ _ \/ _ \/ _ `/ __/ _  /
"  \___/_/_/ .__/_.__/\___/\_,_/_/  \_,_/
"         /_/

" Share the clipboard between Neovim and the system
set clipboard+=unnamedplus
 
" Make <Leader>+C and <Leader>+V acts like copy and paste
vnoremap <leader>c "+y
vnoremap <leader>C "+Y
nnoremap <leader>c "+y
nnoremap <leader>C "+Y
vnoremap <leader>v "+p
vnoremap <leader>V "+P
nnoremap <leader>v "+p
nnoremap <leader>V "+P
cnoremap <leader>c "+y+
cnoremap <leader>C "+Y+
