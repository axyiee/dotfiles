(import-macros {: set! : remap! : autocmd!} :ocean.macros.vim)
(import-macros {: define-standalone!} :ocean.macros.lazy)

(define-standalone! :core)

;; fnlfmt: skip
(fn post-install []
  "A post-install hook that tweaks all relevant properties for a snappier Neovim experience."

  ;; [->]Theming[<-]
  (set! termguicolors)
  (set! background :dark)

  ;; [->]Eye-candy[<-]
  (set! shortmess+ :sWcI)
  (set! conceallevel 2)
  (set! nowrap)
  (set! number)
  (set! fillchars "eob: ,fold: ,foldopen:,foldsep: ,foldclose:")

  ;; [->]Quality of Life[<-]
  (set! clipboard :unnamedplus)
  (set! mouse :a)
  (set! undofile)
  (set! nowritebackup)
  (set! noswapfile)
  (set! ignorecase)
  (set! smartcase)
  (set! updatetime 250)
  (set! timeoutlen 400)

  ;; [->]Keymaps[<-]
  (remap! [n] :<S-Tab> "<cmd>wincmd p<cr>" {:desc "Switch buffer focus."})
  (remap! [niv] :<C-s> :<cmd>:w<cr> {:desc "Save current buffer changes."})

  ;; [->]Format on save[<-]
  (autocmd! BufWritePre * `(vim.lsp.buf.format {:async false})
            {:desc "Format asynchronously on save."}))

{: post-install}
