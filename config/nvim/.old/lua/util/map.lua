-- https://github.com/justleoo/kia

local M = {}
local tables = require "util.table"

function M.cmd (str)
  return "<cmd>" .. str .. "<cr>"
end

function M.set (mode, mapping, to_exe, options)
  local base_options = { noremap = true, silent = true }
  local opts = tables.extend(base_options, options or {})
  vim.api.nvim_set_keymap(mode, mapping, to_exe, opts)
end

return M