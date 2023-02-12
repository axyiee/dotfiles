return {
	packer = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-context",
		"sheerun/vim-polyglot",
	},
	data = function()
		return {
			configs = require("nvim-treesitter.configs"),
			parsers = require("nvim-treesitter.parsers"),
		}
	end,
	exec = function(root)
		local config = root.parsers.get_parser_configs()
		config.scala = {
			install_info = {
				url = "https://github.com/keynmol/tree-sitter-scala",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "test-scala3",
				generate_requires_npm = true,
				requires_generate_from_grammar = true,
			},
			filetype = "scala",
			used_by = { "scala", "sbt" },
		}
		config.smithy = {
			install_info = {
				url = "https://github.com/indoorvivants/tree-sitter-smithy",
				files = { "src/parser.c" },
				branch = "main",
				generate_requires_npm = true,
				requires_generate_from_grammar = true,
			},
			filetype = "smithy",
		}
		root.configs.setup({
			ensure_installed = { "lua", "python", "rust", "toml", "bash", "c", "go", "javascript", "typescript" },
			auto_install = true,
			highlight = {
				enable = true,
			},
		})
	end,
}
