(import-macros {: define-lazy!} :ocean.macros.lazy)
(import-macros {: set! : remap!} :ocean.macros.vim)

(define-lazy! :kevinhwang91/nvim-ufo {:component :editor.code-folding
                                      :dependencies [:kevinhwang91/promise-async]})

(fn post-install []
  "A post-installation hook that sets up modern fold-feature looks for Neovim."
  (set! foldcolumn :1)
  (set! foldlevel 99)
  (set! foldlevelstart 99)
  (set! foldenable true)
  (remap! [n] :<leader>FO "<cmd>lua require'ufo'.openAllFolds()<cr>" {:desc "Open all closed code folds."})
  (remap! [n] :<leader>FC "<cmd>lua require'ufo'.closeAllFolds()<cr>" {:desc "Close all open code folds."})
  (let [ufo (require :ufo)]
    (ufo.setup {:provider_selector (fn [_ _ _] [:treesitter :indent])})))

{: post-install}
