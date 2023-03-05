(import-macros {: define-lazy! : setup!} :ocean.macros.lazy)

(define-lazy! "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  {:component :code-checking.diagnostics.lsp-lines})

(fn post-install []
  "A post-installation hook that sets up better looking LSP diagnostics."
  (let [(has-lsp _) (pcall require :lspconfig)]
    (when has-lsp
      (vim.fn.sign_define :DiagnosticSignError
                          {:text " " :texthl :DiagnosticSignError})
      (vim.fn.sign_define :DiagnosticSignWarn
                          {:text " " :texthl :DiagnosticSignWarn})
      (vim.fn.sign_define :DiagnosticSignInfo
                          {:text " " :texthl :DiagnosticSignInfo})
      (vim.fn.sign_define :DiagnosticSignHint
                          {:text "" :texthl :DiagnosticSignHint})
      (vim.diagnostic.config {:underline {:severity {:min vim.diagnostic.severity.INFO}}
                              :signs {:severity {:min vim.diagnostic.severity.INFO}}
                              :virtual_text false
                              :update_in_insert true
                              :severity_sort true
                              :float {:show_header false :border :rounded}})
      (setup! lsp_lines))))

{: post-install}
