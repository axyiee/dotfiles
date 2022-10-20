return {
	data = function()
		return {
			lsp = {
				name = "kotlin_language_server",
				root = {
					root_dir = require("lspconfig/util").root_pattern("settings.gradle.kts", "settings.gradle", ".git"),
					cmd = { "kotlin-language-server" },
				},
			},
		}
	end,
}
