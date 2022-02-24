--     ____                   _____         __
--    / __/_ ________ __ __  / __(_)__  ___/ /__ ____
--   / _// // /_ /_ // // / / _// / _ \/ _  / -_) __/
--  /_/  \_,_//__/__/\_, / /_/ /_/_//_/\_,_/\__/_/
--                  /___/

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
