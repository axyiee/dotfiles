-- {
--  packer = {
--      "nvim-treesitter/nvim-treesitter.lua",
--   },
--   api = {
--      { "kyazdani42/nvim-web-devicons.lua", opt = true },
--   }
--   depends = { "editor.lsp" },
--   data = function()
--      require 'nvim-treesitter'
--   end,
--   after = {},
--   exec = function(treesitter, lsp)
--      treesitter.setup {}
--      lsp.do_something {}
--   end,
-- }

local M = { prefix = "module." }
local P = require(M.prefix .. "internal.packer")

local already_loaded = {}

function M.load(use, name)
    if already_loaded[name] then
        return
    end
    local ok, settings = pcall(require, M.prefix .. name)
    if not ok then
        vim.notify("Module '" .. name .. "' not found")
        return
    end
    local data = settings.data or function() end
    local params = {}
    if settings.depends then
        for _, dep in ipairs(settings.depends) do
            table.insert(params, M.load(use, dep))
        end
    end
    local exec = function()
        local modules = {}
        for _, dependency in ipairs(params) do
            table.insert(modules, dependency.data())
        end
        settings.exec(data(), table.unpack(modules))
    end
    if settings.packer then
        for i, module in ipairs(settings.packer) do
            local config = {
                github = module.github,
                api = module.api,
                after = module.after,
            }
            if i == #settings.packer then
                config.config = exec
            end
            P.use(use, config)
        end
    else
        exec()
    end
    return data
end

function M.after()
    P.sync()
end

return M
