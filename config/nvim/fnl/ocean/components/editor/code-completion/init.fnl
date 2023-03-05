;; Inspiration: nyoom.nvim

(import-macros {: define-lazy!} :ocean.macros.lazy)

(local icons {:Text "  "
              :Method "  "
              :Function "  "
              :Constructor "  "
              :Field "  "
              :Variable "  "
              :Class "  "
              :Interface "  "
              :Module "  "
              :Property "  "
              :Unit "  "
              :Value "  "
              :Enum "  "
              :Keyword "  "
              :Snippet " 󱜚 "
              :Color "  "
              :File "  "
              :Reference "  "
              :Folder "  "
              :EnumMember "  "
              :Constant "  "
              :Struct "  "
              :Event "  "
              :Operator "  "
              :Copilot "  "
              :TypeParameter "  "})

(fn has-words-before []
  (when (= (vim.api.nvim_buf_get_option 0 :buftype) :prompt)
    (lua "return false"))
  (local (line col) (unpack (vim.api.nvim_win_get_cursor 0)))
  (and (not= col 0) (= (: (. (vim.api.nvim_buf_get_text 0 (- line 1) 0
							(- line 1) col {})
			     1) :match "^%s*$") nil)))

(define-lazy! :hrsh7th/nvim-cmp {:component :editor.code-completion
                                 :event [:InsertEnter :CmdLineEnter]
                                 :dependencies [{1 :hrsh7th/cmp-nvim-lsp :lazy true}
                                                {1 :hrsh7th/cmp-nvim-lsp-signature-help :lazy true}
                                                {1 :hrsh7th/cmp-buffer :lazy true}
                                                {1 :hrsh7th/cmp-path :lazy true}
                                                {1 :hrsh7th/cmp-cmdline :lazy true}
                                                {1 :zbirenbaum/copilot-cmp :lazy true}
                                                :L3MON4D3/LuaSnip
                                                :rafamadriz/friendly-snippets
                                                :saadparwaiz1/cmp_luasnip]})

(fn post-install []
  "A post-installation hook that enables advanced completion support for Neovim."
  (let [cmp (require :cmp)
	    (lsp-ok _) (pcall require :lspconfig)
      (copilot-ok _) (pcall require :copilot)
	    sources [{:name :luasnip}]
		  snip (require :luasnip)]
    (when lsp-ok
      (table.insert sources {:name :nvim_lsp :group_index 1})
      (table.insert sources {:name :nvim_lsp_signature_help :group_index 1}))
    (when copilot-ok
      (let [copilot (require :copilot_cmp)]
        (copilot.setup))
      (table.insert sources {:name :copilot :group_index 2})
      (cmp.event:on :menu_opened
                    (fn []
                      (set vim.b.copilot_suggestion_hidden
                           true)))
      (cmp.event:on :menu_closed
                    (fn []
                      (set vim.b.copilot_suggestion_hidden false))))
    (cmp.setup {:experimental {:ghost_text true}
	       :snippet {:expand (fn [args] (snip.lsp_expand args.body))}
	       :view {:entries {:name :custom :selection_order :near_cursor}}
	       :window {:documentation {:border :solid}
	                :completion {:side_padding 0
				     :winhighlight "Normal:NormalFloat,NormalFloat:Pmenu,Pmenu:NormalFloat"}}
	       :mapping (cmp.mapping.preset.insert {:<C-j> (cmp.mapping.select_next_item)
						   :<C-k> (cmp.mapping.select_prev_item)
						   :<C-f> (cmp.mapping.scroll_docs -5)
						   :<C-u> (cmp.mapping.scroll_docs 5)
						   :<C-Space> (cmp.mapping.complete)
						   :<Esc> (cmp.mapping.abort)
						   :<C-q> (cmp.mapping.abort)
						   :<Tab> (vim.schedule_wrap (fn [fallback]
									       (if (and (cmp.visible)
											(has-words-before))
										   (cmp.select_next_item {:behavior cmp.SelectBehavior.Select})
										   (snip.expand_or_jumpable)
										   (snip.expand_or_jump)
										   (fallback)
										   [:i :s :c])))
						   :<S-Tab> (vim.schedule_wrap (fn [fallback]
										 (if (and (cmp.visible)
											  (has-words-before))
										     (cmp.select_prev_item {:behavior cmp.SelectBehavior.Select})
										     (snip.jumpable -1)
										     (snip.jump -1)
										     (fallback)))
									       [:i :s :c])
						   :<C-c> (fn [fallback]
							    (if (cmp.visible)
								(do
								  (cmp.mapping.close)
								  (vim.cmd :stopinsert))
								(fallback)))
               :<Up> (cmp.mapping.abort)
               :<Down> (cmp.mapping.abort)
						   :<Space> (cmp.mapping.confirm {:select false})
						   :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Replace 
									      :select false})})
	       :sources (cmp.config.sources sources [{:name :path} {:name :buffer}])
	       :formatting {:fields {1 :kind 2 :abbr 3 :menu}
	       :format (fn [_ vim-item]
			 (set vim-item.menu vim-item.kind)
			 (set vim-item.kind (.. (. icons vim-item.kind) " "))
			 vim-item)}})
    (cmp.setup.cmdline "/"
                   {:mapping (cmp.mapping.preset.cmdline)
                    :sources [{:name :buffer}]})
    (cmp.setup.cmdline ":"
                   {:mapping (cmp.mapping.preset.cmdline)
                    :sources [{:name :path} {:name :cmdline}]})
    ((. (require :luasnip.loaders.from_vscode) :lazy_load))))

{: post-install}
