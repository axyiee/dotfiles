(import-macros {: lazy-plugin} :ocean.macros.lazy)

(fn lazy []
  "A simple initial step for setting up lazy.nvim functions."
  (lazy-plugin "nvim-treesitter/nvim-treesitter" 
	       {:dependencies ["windwp/nvim-ts-autotag" 
			       "mrjones2014/nvim-ts-rainbow"]}))

(fn post-install []
  "A post-installation hook that enables enhanced syntax highlighting support, TSX AutoTag, and rainbow parentheses."
  (let [treesitter (require :nvim-treesitter.configs)]
    (treesitter.setup
      {:ensure_installed ["fennel" "lua" "bash" "javascript" "typescript" "html" "css"]
       :highlight {:enable true}
       :auto_install true
       :autotag {:enable true}
       :rainbow {:enable true 
       		 :disable ["jsx" "tsx" "c" "html" "astro" "js" "ts" "svelte" "py" "sh" "lua"]
		 :max_file_lines 3000}})))

{: lazy
 : post-install}
