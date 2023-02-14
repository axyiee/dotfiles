(import-macros {: lazy-plugin} :ocean.macros.lazy)
(import-macros {: key-map} :ocean.macros.vim-api)

(fn lazy []
  "A simple initial step for setting up lazy.nvim functions."
  (lazy-plugin :neovim/nvim-lspconfig {:dependencies [:williamboman/mason.nvim
						      :williamboman/mason-lspconfig.nvim]}))

(fn post-install []
  "A post-install hook setting up LSP support for Neovim alongside an extra UI for managing 
   neat development tools."
  (key-map :n :<leader>mao :<cmd>Mason<cr>    {:desc "Open Mason's graphical status window"})
  (key-map :n :<leader>mal :<cmd>MasonLog<cr> {:desc "Open Mason's logging menu"})
  (let [mason (require :mason) mason-lspconfig (require :mason-lspconfig)]
    (mason.setup)
    (mason-lspconfig.setup {:ensure_installed [:fennel_language_server]})
    (let [lsp-config (require :lspconfig) 
	  settings lsp-config.util.default_config 
	  (cmp-ok cmp-nvim-lsp) (pcall :require :cmp-nvim-lsp)]
      (when cmp-ok
	(print :wow)
	(vim.tbl_deep_extend :force settings.capabilities cmp-nvim-lsp.default_capabilities))
            (mason-lspconfig.setup_handlers { 1 (fn [server-name] ((. (. lsp-config server-name):setup) {}))
					    :fennel_language_server (fn [] (lsp-config.fennel_language_server.setup {:root_dir (lsp-config.util.root_pattern :fnl)
														    :settings {:fennel {:workspace {:library (vim.api.nvim_list_runtime_paths)} 
														    :diagnostics {:globals [:vim]}}}}))}))))

{: lazy
 : post-install}
