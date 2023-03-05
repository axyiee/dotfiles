(import-macros {: define-lazy! : setup!} :ocean.macros.lazy)

(define-lazy! :jay-babu/mason-null-ls.nvim
  {:component :editor.null
   :dependencies [:nvim-lua/plenary.nvim :jose-elias-alvarez/null-ls.nvim]
   :event :BufReadPre})

(fn post-install []
  "A post-installation hook that sets up code formatting and linting via null-ls.nvim."
  (setup! mason-null-ls)
  (let [null-ls (require :null-ls)]
    (null-ls.setup {:sources [null-ls.builtins.formatting.fnlfmt
                              null-ls.builtins.formatting.deno_fmt]})))

{: post-install}
