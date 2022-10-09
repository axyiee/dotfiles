local function setup(client, capabilities, on_attach)
    client.rescriptls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
            "node",
            "~/.local/share/nvim/lsp-vsix/rescript/extension/server/out/server.js",
            "--stdio",
        },
    })
end

return {
    setup = setup,
}
