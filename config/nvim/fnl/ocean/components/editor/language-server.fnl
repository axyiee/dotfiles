(require-macros :ocean.macros.lazy)
(require-macros :ocean.macros.vim)

(define-lazy! :neovim/nvim-lspconfig
  {:component :editor.language-server
   :dependencies [:williamboman/mason.nvim :williamboman/mason-lspconfig.nvim]})

(fn post-install []
  "A post-install hook setting up LSP support for Neovim alongside an extra UI for managing 
  neat development tools."
  (setup! mason)
  (setup! mason-lspconfig)
  (let [lsp-config (require :lspconfig)
        mason-lspconfig (require :mason-lspconfig)
        (cmp-ok cmp-nvim-lsp) (pcall require :cmp_nvim_lsp)]
    (when cmp-ok
      (vim.tbl_deep_extend :force lsp-config.util.default_config.capabilities
                           (cmp-nvim-lsp.default_capabilities)))
    (lsp-config.denols.setup {})
    (lsp-config.pyright.setup {})))

{: post-install}
