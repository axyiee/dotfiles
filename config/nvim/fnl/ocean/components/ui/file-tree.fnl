(import-macros {: define-lazy! : setup!} :ocean.macros.lazy)

(define-lazy! :nvim-neo-tree/neo-tree.nvim {:component :ui.file-tree
                                            :dependencies [:nvim-lua/plenary.nvim
                                                            :nvim-tree/nvim-web-devicons
                                                            :MunifTanjim/nui.nvim]
                                            :branch :main})

(fn post-install []
  "A post-installation hook that sets up a modern file tree for Neovim."
  (vim.cmd "let g:neo_tree_remove_legacy_commands = 1")
  (setup! neo-tree {:popup_border_style :solid
                    :window {:position :left :width 30}
                    :filesystem {:use_libuv_file_watcher true
                                 :follow_current_file true}
                    :use_popups_for_input true
                    :default_component_configs {:indent {:with_markers false}
                            :modified {:symbol ""}
                            :git_status {:symbols {:added "✚"
                                                   :deleted ""
                                                   :modified ""
                                                   :renamed "凜"
                                                   :untracked "󰎔"
                                                   :ignored ""
                                                   :unstaged ""
                                                   :staged ""
                                                   :conflict ""}}}}))

{: post-install}
