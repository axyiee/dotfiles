return {
    packer = {
        "mfussenegger/nvim-jdtls",
    },
    data = function()
        local capabilities = require("jdtls").extendedClientCapabilities
        capabilities.resolveAdditionalTextEditsSupport = true
        capabilities.progressReportProvider = false
        return {
            capabilities = capabilities,
            flags = {
                server_side_fuzzy_completion = true,
            },
            handlers = {
                ["language/status"] = function() end,
            },
            cmd = { "jdtls" },
            on_attach = require("module.shortcuts.jdtls").data,
            init_options = {
                extendedClientCapabilities = capabilities,
                bundles = {},
            },
            root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
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
        }
    end,
    exec = function(root)
        -- Attach jdtls to all java buffers - autocmd BufEnter *.java
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*.java",
            callback = function()
                require("jdtls").start_or_attach(root)
            end,
        })
    end,
}
