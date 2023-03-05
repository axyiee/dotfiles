(import-macros {: define-lazy! : setup!} :ocean.macros.lazy)

(define-lazy! :nvim-treesitter/nvim-treesitter
  {:component :editor.highlight.treesitter
   :dependencies [:JoosepAlviste/nvim-ts-context-commentstring
                  :windwp/nvim-ts-autotag]
   :cmd [:TSInstall
         :TSUpdate
         :TSBufEnable
         :TSBufDisable
         :TSEnable
         :TSDisable
         :TSModuleInfo]
   :event :BufRead
   :build ":TSUpdate"})

(fn post-install []
  "A post-installation hook that enables enhanced syntax highlighting support, TSX AutoTag,
   and rainbow parentheses."
  (setup! nvim-treesitter.configs
          {:ensure_installed [:fennel
                              :lua
                              :bash
                              :javascript
                              :typescript
                              :html
                              :css]
           :highlight {:enable true}
           :auto_install true
           :autotag {:enable true}
           :context_commentstring {:enable true}}))

{: post-install}
