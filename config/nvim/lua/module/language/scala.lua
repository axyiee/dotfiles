return {
	packer = {
		"scalameta/nvim-metals",
	},
	api = {
		"nvim-lua/plenary.nvim",
	},
	data = function()
		return {
			init = function(capabilities)
				local metals = require("metals").bare_config()
				metals.settings = {
					showImplicitArguments = true,
				}
				metals.handlers = {
					["metals/status"] = function(_, status, ctx)
						vim.lsp.handlers["$/progress"](_, {
							token = 1,
							value = {
								kind = status.show and "begin" or status.hide and "end" or "report",
								message = status.text,
							},
						}, ctx)
					end,
				}
				metals.capabilities = capabilities
				metals.on_attach = require("module.shortcuts.lsp").data().on_attach
				metals.init_options.statusBarProvider = "on"
				metals.root_patterns = {
					"build.sbt",
					"build.sc",
					"build.gradle",
					"build.gradle.kts",
					"pom.xml",
					".scala-build",
					".git",
				}
				local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
				vim.api.nvim_create_autocmd("FileType", {
					pattern = { "scala", "sbt" },
					callback = function()
						require("metals").initialize_or_attach(metals)
					end,
					group = nvim_metals_group,
				})
			end,
		}
	end,
}
