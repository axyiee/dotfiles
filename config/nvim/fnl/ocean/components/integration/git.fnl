(import-macros {: define-lazy!} :ocean.macros.lazy)

(define-lazy! :lewis6991/gitsigns.nvim {:component :integration.git})

(fn post-install []
  "A post-installation hook that sets up Git VCS indicators for Neovim."
  (set vim.o.signcolumn :no)
  (let [signs (require :gitsigns)]
    (signs.setup {:signs {:untracked {:text :│}}
                  :signcolumn true})))

{: post-install}
