function setup(lsp, _, on_attach)
    local o = function(client, bufnr)
        on_attach(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gdi", "<Cmd>lua require'jdtls'.organize_imports()<CR>", bufopts)
        vim.keymap.set("n", "gdt", "<Cmd>lua require'jdtls'.test_class()<CR>", bufopts)
        vim.keymap.set("n", "gdn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", bufopts)
        vim.keymap.set("n", "gde", "<Cmd>lua require'jdtls'.extract_variable()<CR>", bufopts)
        vim.keymap.set("v", "gde", "<Esc><Cmd>lua require'jdtls'.extract_variable(true)<CR>", bufopts)
        vim.keymap.set("n", "gdm", "<Cmd>lua require'jdtls'.extract_method()<CR>", bufopts)
        vim.keymap.set("v", "gdm", "<Esc><Cmd>lua require'jdtls'.extract_method(true)<CR>", bufopts)
    end
    local jdtls = require("jdtls")
    local workspace = "/home/syntax/.local/share/java/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local configuration = "/home/syntax/.local/share/java/jdtls/config_linux"
    local jar = "/home/syntax/.local/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
    local capabilities = jdtls.extendedClientCapabilities
    capabilities.resolveAdditionalTextEditsSupport = true
    local config = {
        capabilities = capabilities,
        flags = {
            server_side_fuzzy_completion = true,
        },
        handlers = {
            ["language/status"] = function() end,
        },
        cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xms1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens",
            "java.base/java.util=ALL-UNNAMED",
            "--add-opens",
            "java.base/java.lang=ALL-UNNAMED",
            "-jar",
            jar,
            "-configuration",
            configuration,
            "-data",
            workspace,
        },
        on_attach = o,
        settings = {
            java = {
                signatureHelp = { enabled = true },
                contentProvider = { preferred = "fernflower" },
                completion = {
                    favoriteStaticMembers = {
                        "java.util.Objects.requireNonNull",
                        "java.util.Objects.requireNonNullElse",
                    },
                    filteredTypes = {
                        "com.sun.*",
                        "io.micrometer.shaded.*",
                        "java.awt.*",
                        "jdk.*",
                        "sun.*",
                    },
                },
                sources = {
                    organizeImports = {
                        starThreshold = 9999,
                        staticStarThreshold = 9999,
                    },
                },
                codeGeneration = {
                    toString = {
                        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                    },
                    hashCodeEquals = {
                        useJava7Objects = true,
                    },
                    useBlocks = true,
                },
                configuration = {
                    runtimes = {
                        {
                            name = "JavaSE-17",
                            path = "/usr/lib/jvm/java-17-temurin/",
                        },
                    },
                },
            },
        },
        init_options = {
            extendedClientCapabilities = capabilities,
            bundles = {},
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
    }

    -- Attach jdtls to all java buffers - autocmd BufEnter *.java
    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.java",
        callback = function()
            jdtls.start_or_attach(config)
        end,
    })
end

return {
    setup = setup,
}
