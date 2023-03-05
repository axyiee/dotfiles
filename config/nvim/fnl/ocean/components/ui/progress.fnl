(import-macros {: define-lazy! : setup!} :ocean.macros.lazy)

(define-lazy! :j-hui/fidget.nvim {:component :ui.progress})

(fn post-install []
  "A post-installation hook that sets up a status/progress bar for LSP clients services."
  (setup! fidget))

{: post-install}
