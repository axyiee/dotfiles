return {
	packer = {
		"rktjmp/hotpot.nvim",
	},
	data = function()
		return require("hotpot")
	end,
	exec = function(root)
		root.setup({
			provide_require_fennel = true,
			enable_hotpot_diagnostics = true,
			compiler = {
				modules = {
					correlate = true,
				},
			},
		})
		require("hello")
	end,
}
