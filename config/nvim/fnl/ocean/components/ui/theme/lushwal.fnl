(import-macros {: define-lazy!} :ocean.macros.lazy)

(define-lazy! :rktjmp/lush.nvim {:component :ui.theme.lushwal})

(fn post-install []
  "A post-install hook that applies a theme on Neovim based on the current pywal context."
  (vim.cmd.colorscheme :lushwal))

{: post-install}
