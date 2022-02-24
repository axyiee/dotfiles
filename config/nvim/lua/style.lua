--     ______       __
--    / __/ /___ __/ /__
--   _\ \/ __/ // / / -_)
--  /___/\__/\_, /_/\__/
--          /___/

function make_transparent()
  require("transparent").setup({
    enable = true, -- boolean: enable transparent
    extra_groups = { -- table/string: additional groups that should be clear
      -- In particular, when you set it to 'all', that means all avaliable groups

      -- example of akinsho/nvim-bufferline.lua
      "BufferLineTabClose",
      "BufferlineBufferSelected",
      "BufferLineFill",
      "BufferLineBackground",
      "BufferLineSeparator",
      "BufferLineIndicatorSelected",
    },
    exclude = {}, -- table: groups you don't want to clear
  })
end

vim.ui.select = require"popui.ui-overrider"
pcall(make_transparent)

require('statusline')
require('startpage')
