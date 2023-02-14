(import-macros {: lazy-plugin} :ocean.macros.lazy)

(fn lazy []
  "A simple initial step for setting up lazy.nvim functions."
  (lazy-plugin :jose-elias-alvarez/null-ls.nvim {:dependencies [:nvim-lua/plenary.nvim
								:jay-babu/mason-null-ls.nvim]}))

(fn post-install []
  "A post-installation hook that sets up code formatting and linting via null-ls.nvim."
  (let [null-ls (require :null-ls) mason-null-ls (require :mason-null-ls)]
    (mason-null-ls.setup {:ensure_installed [:editorconfig_checker]
			  :automatic_setup true})))

{: lazy
 : post-install}
