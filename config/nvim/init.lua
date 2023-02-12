local plugins_path = vim.fn.stdpath("data") .. "/lazy"

-- Bootstrap lazy.nvim [Package manager]
local lazy_path = plugins_path .. "/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  vim.notify("Bootstrapping package manager (lazy.nvim)...", vim.log.levels.INFO)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path,
  })
end

-- Boostrap hotpot.nvim [Fennel support]
local hotpot_path = plugins_path .. "/hotpot.nvim"
if not vim.loop.fs_stat(hotpot_path) then 
  vim.notify("Bootstrapping Fennel support (hotpot.nvim)...", vim.log.levels.INFO)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "-b",
    "nightly",
    "--single-branch",
    "https://github.com/rktjmp/hotpot.nvim.git",
    hotpot_path,
  })
end

-- Append required components to the runtime path variables
vim.opt.rtp:prepend(lazy_path)
vim.opt.rtp:prepend(hotpot_path)

-- Set up Fennel support
require("hotpot").setup({
    provide_required_fennel = true,
    enable_hotpot_diagnostics = false,
    compiler = {
        modules = {
	    correlate = true,
	},
	macros = {
	    env = "_COMPILER",
	    compilerEnv = _G,
	    allowGlobals = true,
        },
    }
})

require('ocean')
