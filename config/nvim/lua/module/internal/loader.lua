-- {
--  packer = {
--      "nvim-treesitter/nvim-treesitter.lua",
--   },
--   api = {
--      { "kyazdani42/nvim-web-devicons.lua", opt = true },
--   }
--   make = {
--     "nvim-treesitter/nvim-treesitter-textobjects.lua",
--   },
--   depends = { "editor.lsp" },
--   data = function()
--      require 'nvim-treesitter'
--   end,
--   exec = function(treesitter, lsp)
--      treesitter.setup {}
--      lsp.do_something {}
--   end,
-- }

local M = { prefix = "module." }
local P = require(M.prefix .. "internal.packer")

M.already_loaded = {}

-- compatibility
table.unpack = table.unpack or unpack

function M.load(name)
	local previous = M.already_loaded[name]
	if previous then
		return previous.data
	end
	local ok, settings = pcall(require, M.prefix .. name)
	if not ok then
		vim.notify("Module '" .. name .. "' not found")
		return
	end
	M.already_loaded[name] = settings
	for _, dep in ipairs(settings.depends or {}) do
		M.load(dep)
	end
	local data = settings.data or function()
		return {}
	end
	local exec = [[
	    local settings = require('..prefix..name')
	    if settings.exec then
		    local params = { (settings.data or function() return {} end)() }
		    local M = require('..prefixinternal.loader')
		    for _, dep in ipairs(settings.depends or {}) do
		        table.insert(params, M.load(dep)())
		    end
		    settings.exec(table.unpack(params))
	    end
	]]
	local apply = exec:gsub("..prefix", M.prefix):gsub("..name", name)
	local modules = {}
	if settings.packer then
		for i, module in ipairs(settings.packer) do
			local options = { github = module, make = false, api = settings.api, branch = settings.branch }
			if i == 1 then
				options.config = apply
			end
			table.insert(modules, options)
		end
	end
	if settings.make then
		for _, module in ipairs(settings.make) do
			table.insert(modules, { github = module, api = settings.api, make = true })
		end
	end
	for _, options in ipairs(modules) do
		P.use(options)
	end
	if not settings.packer and not settings.make then
		loadstring(apply)()
	end
	return data
end

function M.after()
	P.sync()
end

return M
