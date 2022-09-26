local function setup(lsp, capabiltities, on_attach)
    lsp.elixirls.setup({
        on_attach = on_attach,
        capabilities = capabiltities,
        cmd = { "elixir-ls" },
    })
end

return {
    setup = setup,
}
