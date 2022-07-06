--     __ __         __   _         ___             
--    / //_/__ __ __/ /  (_)__  ___/ (_)__  ___ ____
--   / ,< / -_) // / _ \/ / _ \/ _  / / _ \/ _ `(_-<
--  /_/|_|\__/\_, /_.__/_/_//_/\_,_/_/_//_/\_, /___/
--           /___/                        /___/  

local map = require"util.map"

-- Sugar
----------------------------------------------------------------------------------
-- Keybindings usually made to be similar to other text editors and to be simpler.

vim.g.mapleader = ',' -- Set the global leader key.

map.set("n", "<C-s>", map.cmd"w!") -- Save the current file by using the Ctrl+S.
map.set("n", "<C-x>", map.cmd"q!") -- Quit the current file by using the Ctrl+X.

-- Telescope
----------------------------------------------------------------------------------
-- Keybindings related to the telescope plugin.

map.set("n", "<leader>ff", map.cmd"Telescope find_files") -- Open a file finding window.
map.set("n", "<leader>fg", map.cmd"Telescope live_grep") -- Open a live grep window.
map.set("n", "<leader>fb", map.cmd"Telescope buffers") -- Open a buffers window.

-- nvim-tree.lua
----------------------------------------------------------------------------------
-- Keybindings related to the file tree.

map.set("n", "<leader>t", map.cmd"NvimTreeToggle") -- Toggle the file tree.

