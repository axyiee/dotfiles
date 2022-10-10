return {
    data = function(client, bufnr)
        local shortcut = require("module.api.shortcut").data()
        shortcut.map_cmd("n", "gdi", "lua require('jdtls').organize_imports()")
        shortcut.map_cmd("n", "gdt", "lua require('jdtls').test_class()")
        shortcut.map_cmd("n", "gdn", "lua require('jdtls').test_nearest_method()")
        shortcut.map_cmd("n", "gde", "lua require('jdtls').extract_variable()")
        shortcut.map_cmd("v", "gde", "<Esc>lua require('jdtls').extract_variable(true)")
        shortcut.map_cmd("n", "gdm", "lua require('jdtls').extract_method()")
        shortcut.map_cmd("v", "gdm", "<Esc>lua require('jdtls').extract_method(true)")
        require("module.shortcuts.lsp").data().on_attach(client, bufnr)
    end,
}
