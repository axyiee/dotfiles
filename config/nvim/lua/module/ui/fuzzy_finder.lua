return {
	packer = {
		"nvim-telescope/telescope.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	make = {
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	api = {
		"nvim-lua/plenary.nvim",
	},
	data = function()
		return require("telescope")
	end,
	exec = function(root)
		root.setup({
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				file_browser = {
					theme = "ivy",
					hijack_netrw = false,
				},
			},
		})
		root.load_extension("fzf")
		root.load_extension("ui-select")
		root.load_extension("file_browser")
	end,
}
