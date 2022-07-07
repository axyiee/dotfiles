function setup (lsp, capabilities, on_attach)
    lsp.rust_analyzer.setup {
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGracnularity = "module",
                    importPrefix = "by_self",
                },
                cargo = {
                    loadOutDirsFromCheck = true
                },
                procMacro = {
                    enable = true
                },
            }
        },
        capabilities = capabilities,
    }
end

return {
	setup = setup
}
