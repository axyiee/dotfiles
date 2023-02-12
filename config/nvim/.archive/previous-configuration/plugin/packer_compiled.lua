-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = true
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/run/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/run/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/run/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/run/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/run/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\t    local settings = require('module.editor.comment')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\t    local settings = require('module.ui.startup')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["barbar.nvim"] = {
    config = { "\t    local settings = require('module.ui.bufferline')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["centerpad.nvim"] = {
    config = { "\t    local settings = require('module.editor.centerpad')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/centerpad.nvim",
    url = "https://github.com/smithbm2316/centerpad.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    config = { "\t    local settings = require('module.integration.copilot')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["crates.nvim"] = {
    config = { "\t    local settings = require('module.language.rust')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\t    local settings = require('module.ui.lsp_progress')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-conflict.nvim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\t    local settings = require('module.integration.git')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hotpot.nvim"] = {
    config = { "\t    local settings = require('module.language.fennel')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/hotpot.nvim",
    url = "https://github.com/rktjmp/hotpot.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\t    local settings = require('module.performance.impatient')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\t    local settings = require('module.editor.indent')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_lines.nvim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["move.nvim"] = {
    config = { "\t    local settings = require('module.editor.move')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/move.nvim",
    url = "https://github.com/fedepujol/move.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\t    local settings = require('module.editor.formatting')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\t    local settings = require('module.editor.autopairs')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\t    local settings = require('module.editor.completion')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\t    local settings = require('module.editor.colorizer')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-jdtls"] = {
    config = { "\t    local settings = require('module.language.java')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    config = { "\t    local settings = require('module.editor.lsp')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-metals"] = {
    config = { "\t    local settings = require('module.language.scala')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-metals",
    url = "https://github.com/scalameta/nvim-metals"
  },
  ["nvim-notify"] = {
    config = { "\t    local settings = require('module.ui.notify')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-regexplainer"] = {
    config = { "\t    local settings = require('module.ui.regex')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-regexplainer",
    url = "https://github.com/bennypowers/nvim-regexplainer"
  },
  ["nvim-tree.lua"] = {
    config = { "\t    local settings = require('module.ui.file_tree')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\t    local settings = require('module.editor.highlight')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/mrjones2014/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { "\t    local settings = require('module.integration.discord')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    cond = { false },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\t    local settings = require('module.ui.fuzzy_finder')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    config = { "\t    local settings = require('module.editor.illuminate')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["yuck.vim"] = {
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/yuck.vim",
    url = "https://github.com/elkowar/yuck.vim"
  },
  ["zenbones.nvim"] = {
    config = { "\t    local settings = require('module.theme.zenbones')\n\t    if settings.exec then\n\t\t    local params = { (settings.data or function() return {} end)() }\n            local M = require('module.internal.loader')\n\t\t    for _, dep in ipairs(settings.depends or {}) do\n\t\t        table.insert(params, M.load(dep)())\n\t\t    end\n            settings.exec(table.unpack(params))\n\t    end\n\t" },
    loaded = true,
    path = "/home/run/.local/share/nvim/site/pack/packer/start/zenbones.nvim",
    url = "https://github.com/mcchrish/zenbones.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
	    local settings = require('module.editor.indent')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for indent-blankline.nvim]], false)
-- Config for: zenbones.nvim
time([[Config for zenbones.nvim]], true)
	    local settings = require('module.theme.zenbones')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for zenbones.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
	    local settings = require('module.editor.lsp')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for nvim-lspconfig]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
	    local settings = require('module.integration.discord')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for presence.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
	    local settings = require('module.ui.notify')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for nvim-notify]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
	    local settings = require('module.integration.copilot')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for copilot.vim]], false)
-- Config for: nvim-regexplainer
time([[Config for nvim-regexplainer]], true)
	    local settings = require('module.ui.regex')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for nvim-regexplainer]], false)
-- Config for: centerpad.nvim
time([[Config for centerpad.nvim]], true)
	    local settings = require('module.editor.centerpad')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for centerpad.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
	    local settings = require('module.ui.file_tree')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for nvim-tree.lua]], false)
-- Config for: move.nvim
time([[Config for move.nvim]], true)
	    local settings = require('module.editor.move')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for move.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
	    local settings = require('module.editor.comment')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for Comment.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
	    local settings = require('module.editor.highlight')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for nvim-treesitter]], false)
-- Config for: crates.nvim
time([[Config for crates.nvim]], true)
	    local settings = require('module.language.rust')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for crates.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
	    local settings = require('module.ui.fuzzy_finder')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for telescope.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
	    local settings = require('module.editor.autopairs')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-metals
time([[Config for nvim-metals]], true)
	    local settings = require('module.language.scala')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for nvim-metals]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
	    local settings = require('module.editor.formatting')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for null-ls.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
	    local settings = require('module.ui.startup')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for alpha-nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
	    local settings = require('module.integration.git')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for gitsigns.nvim]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
	    local settings = require('module.editor.illuminate')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for vim-illuminate]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
	    local settings = require('module.editor.completion')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for nvim-cmp]], false)
-- Config for: hotpot.nvim
time([[Config for hotpot.nvim]], true)
	    local settings = require('module.language.fennel')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for hotpot.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
	    local settings = require('module.ui.bufferline')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for barbar.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
	    local settings = require('module.editor.colorizer')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for nvim-colorizer.lua]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
	    local settings = require('module.performance.impatient')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for impatient.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
	    local settings = require('module.ui.lsp_progress')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for fidget.nvim]], false)
-- Config for: nvim-jdtls
time([[Config for nvim-jdtls]], true)
	    local settings = require('module.language.java')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
            local M = require('module.internal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
            settings.exec(table.unpack(params))
	    end
	
time([[Config for nvim-jdtls]], false)
-- Conditional loads
time([[Conditional loading of telescope-fzf-native.nvim]], true)
  require("packer.load")({"telescope-fzf-native.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope-fzf-native.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
