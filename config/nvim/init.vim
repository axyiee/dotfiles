"   _   ___         ____        _      __  _
"  | | / (_)_ _    / __/_______(_)__  / /_(_)__  ___ _
"  | |/ / /  ' \  _\ \/ __/ __/ / _ \/ __/ / _ \/ _ `/
"  |___/_/_/_/_/ /___/\__/_/ /_/ .__/\__/_/_//_/\_, /
"                             /_/              /___/

runtime viml/general.vim
runtime viml/clipboard.vim
runtime viml/style.vim
runtime viml/tree.vim
runtime viml/autostart.vim
runtime viml/shortcuts.vim
runtime viml/neovide.vim
runtime viml/programming.vim
runtime viml/wildmenu.vim


"     __               ____        _      __  _
"    / /  __ _____ _  / __/_______(_)__  / /_(_)__  ___ _
"   / /__/ // / _ `/ _\ \/ __/ __/ / _ \/ __/ / _ \/ _ `/
"  /____/\_,_/\_,_/ /___/\__/_/ /_/ .__/\__/_/_//_/\_, /
"                                /_/              /___/

" Load all Packer plugins
lua require('plugins')

" Style and customization settings
lua require('style')
lua require('lsp')
lua require('fuzzy_finder')


"    ______       __      ____    __  __  _
"   / __/ /___ __/ /__   / __/__ / /_/ /_(_)__  ___ ____
"  _\ \/ __/ // / / -_) _\ \/ -_) __/ __/ / _ \/ _ `(_-<
" /___/\__/\_, /_/\__/ /___/\__/\__/\__/_/_//_/\_, /___/
"         /___/                               /___/

" Add a leader to allow extra key combinations
map <Space> <Leader>
nmap <leader>w :w!<cr>

