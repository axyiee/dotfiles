(import-macros {: define-standalone!} :ocean.macros.lazy)
(import-macros {: remap! : autocmd!} :ocean.macros.vim)

(define-standalone! :keybindings.lsp)

(fn post-install []
  "A post-install hooks that remaps all necessary keys for a working and productive-friendly environment."
  (remap! [n] :<leader>mao :<cmd>Mason<cr>
          {:desc "Open Mason's graphical status window"})
  (remap! [n] :<leader>mal :<cmd>MasonLog<cr>
          {:desc "Open Mason's logging menu"})
  (autocmd! [LspAttach] * `(do
                             (remap! [n] :gD vim.lsp.buf.declaration
                                     {:buffer true})
                             (remap! [n] :gd vim.lsp.buf.definition
                                     {:buffer true})
                             (remap! [n] :K vim.lsp.buf.hover {:buffer true})
                             (remap! [n] :gi vim.lsp.buf.implementation
                                     {:buffer true})
                             (remap! [n] :<C-k> vim.lsp.buf.signature_help
                                     {:buffer true})
                             (remap! [n] :gt vim.lsp.buf.type_definition
                                     {:buffer true})
                             (remap! [n] :gr vim.lsp.buf.references
                                     {:buffer true})
                             (remap! [n] :<leader>f
                                     (fn [] (vim.lsp.buf.format {:async true}))
                                     {:buffer true}))
            {:desc "Attach LSP-related keybindings."}))

{: post-install}
