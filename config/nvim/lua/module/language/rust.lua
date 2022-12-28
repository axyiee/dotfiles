return {
    packer = {
        "saecki/crates.nvim",
    },
    api = {
        "nvim-lua/plenary.nvim",
    },
    data = function()
        return {
            crates = require("crates"),
            lsp = {
                name = "rust_analyzer",
                settings = {
                    ["rust-analyzer"] = {
                        assist = {
                            importGracnularity = "module",
                            importPrefix = "by_self",
                        },
                        cargo = {
                            loadOutDirsFromCheck = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },
        }
    end,
    exec = function(root)
        root.crates.setup({
            null_ls = {
                enabled = true,
                name = "crates.nvim",
            },
        })
    end,
}
