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
--   after = { "after-module" },
-- }
function M.use(use, module)
    if not module.as then
        error("Module must have an alias: " .. module.github)
    end
    use({
        module.github,
        config = module.config or function() end,
        requires = module.api or {},
        after = module.after or {},
    })
end

function M.startup(callback)
    require("packer").startup(function(use)
        use("wbthomason/packer.nvim")
        callback(use)
    end)
end

function M.sync()
    require("packer").sync()
end

return M
