local M = {}

function M.ensure()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

-- {
--   github = "treesitter/nvim-treesitter.lua",
--   config = function() end,
--   api = { { "", opt = true } },
--   make = true
-- }
function M.use(module)
    local config = { module.github }
    if module.api then
        config.requires = module.api
    end
    if module.config then
        config.config = module.config
    end
    if module.as then
	    config.as = module.as
    end
    if module.make then
        config.run = "make"
        config.cond = vim.fn.executable("make") == 1
    end
    require("packer").use(config)
end

function M.init()
    local packer = require("packer")
    packer.init({
        display = {
            --non_interactive = true,
        },
	ensure_dependencies = true,
	compile_on_sync = true,
    })
    packer.use("wbthomason/packer.nvim")
    return packer
end

function M.sync()
    require("packer").sync()
end

return M
