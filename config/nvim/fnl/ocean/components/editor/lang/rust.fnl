(import-macros {: define-lazy! : setup!} :ocean.macros.lazy)
(import-macros {: remap!} :ocean.macros.vim)

(define-lazy! :simrat39/rust-tools.nvim
  {:component :editor.lang.rust :dependencies [:Saecki/crates.nvim]})

(fn post-install []
  "A post-install hooks that sets up extra tools to work with the Rust programming language."
  (setup! crates)
  (setup! rust-tools
          {:server {:settings {:rust-analyzer {:checkOnSave {:command :clippy}}}}}))

{: post-install}
