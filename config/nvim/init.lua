local plugins_path = vim.fn.stdpath("data") .. "/lazy"

function bootstrap(name, kind, git, git_params)
	local path = plugins_path .. "/" .. name
	if not vim.loop.fs_stat(path) then
		vim.notify(string.format("Bootstrapping %s (%s)...", kind, name), vim.log.levels.INFO)
		local init = { "git", "clone", "--filter=blob:none", "--single-branch" }
		for _, value in ipairs(git_params) do 
			table.insert(init, value)
		end
		table.insert(init, git)
		table.insert(init, path)
		vim.fn.system(init)
	end
	vim.opt.rtp:prepend(path)
end

-- Bootstrap lazy.nvim [Package manager]
bootstrap("lazy.nvim", "Package manager", "https://github.com/folke/lazy.nvim.git", {})

-- Boostrap tangerine.nvim [Fennel support]
bootstrap("hotpot.nvim", "Fennel support",  "https://github.com/rktjmp/hotpot.nvim.git", {})
require("hotpot").setup {
	provide_require_fennel = true,
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
	},
}

require("ocean")
