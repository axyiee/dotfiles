(import-macros {: define-standalone!} :ocean.macros.lazy)
(import-macros {: set!} :ocean.macros.vim)

(define-standalone! :ui.status-column)

(fn post-install []
  "A post-install hook that sets up a status column providing folding and gitsigns-related data."
  (local get-data (fn []
                    (let [buf (vim.api.nvim_win_get_buf vim.g.statusline_winid)]
                      (vim.tbl_map (fn [sign]
                                     (. (vim.fn.sign_getdefined sign.name) 1))
                                   (. (. (vim.fn.sign_getplaced buf {:group "*" :lnum vim.v.lnum})
                                         1) :signs)))))
  (local build-column (fn []
                        (var (sign git-sign) nil)
                        (each [_ s (ipairs (get-data))]
                          (if (s.name:find :GitSign) (set git-sign s) (set sign s)))
                        (.. "%s%=%l" 
                            (or (and git-sign (.. :%# git-sign.texthl :#%)) :%#FoldColumn#%)
                            "{foldlevel(v:lnum) > foldlevel(v:lnum - 1)"
                            "? \"\"" 
                            ": foldlevel(v:lnum) == 0"
                            "? \" \""
                            ": \"│\"} ")))
  (global StatusColumn {:build build-column})
  (set! local.statuscolumn "%!v:lua.StatusColumn.build()"))

{: post-install}
