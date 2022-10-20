return {
	data = function()
		return {
			lsp = {
				name = "metals",
				root = {
					root_dir = require("lspconfig/util").root_pattern(
						"build.sbt",
						"build.sc",
						"build.gradle",
						"build.gradle.kts",
						"pom.xml"
					),
					cmd = { "metals" },
				},
			},
		}
	end,
}
