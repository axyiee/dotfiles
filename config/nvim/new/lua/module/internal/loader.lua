-- {
--   packer = {
--      "nvim-treesitter/nvim-treesitter.lua",
--   },
--   api = {
--      { "kyazdani42/nvim-web-devicons.lua", opt = true },
--   }
--   depends = { "editor.lsp" },
--   data = function()
--      require 'nvim-treesitter'
--   end
--   exec = function(treesitter, lsp)
--      treesitter.setup {}
--      lsp.do_something {}
--   end
-- }

local module_prefix = "module."

local M = {}
local P = require(module_prefix .. "internal.packer")

local already_loaded = {}

function M.load(use, name, settings)
    if already_loaded[name] then
        return
    end
    local data = settings.data or function() end
    if settings.depends then
        for _, dep in ipairs(settings.depends) do
            M.load(use, dep, require(module_prefix .. dep))
        end
    end
    if settings.packer then
        for i, module in ipairs(settings.packer) do
            local config = {
                github = module.github,
                api = module.api,
            }
            if i == #settings.packer then
                config.config = function()
                    local root = pcall(require, module_prefix .. name)
                    local modules = {}
                    for _, dependency in ipairs(settings.depends or {}) do
                        table.insert(modules, require(module_prefix .. dependency).data())
                    end
                    settings.exec(root, table.unpack(modules))
                end
            end
            P.use(use, config)
        end
    end
    return data
end

function M.after()
    P.sync()
end

return M
