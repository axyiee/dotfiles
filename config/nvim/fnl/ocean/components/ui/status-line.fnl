;; inspired by nyoom.nvim and https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
(import-macros {: define-lazy!} :ocean.macros.lazy)
(require-macros :ocean.macros.vim)

(define-lazy! :nvim-tree/nvim-web-devicons {:component :ui.status-line})

(fn get-mode-color [?mode]
  "Returns a color to be set when a specific mode is set on a buffer."
  (let [mode (or ?mode (. (vim.api.nvim_get_mode) :mode))]
    (case mode
	  :i "%#StatusInsert#"
	  :ic "%#StatusInsert#"
	  :v "%#StatusVisual#"
	  :V "%#StatusVisual#"
	  "\022" "%#StatusVisual#"
	  :R "%#StatusReplace#"
	  :c "%#StatusCommand#"
	  :t "%#StatusTerminal#"
	  _ "%#StatusNormal#")))

(fn get-mode-display-name [?mode]
  "Returns a display name to be set when a specific mode is set on a buffer."
  (let [mode (or ?mode (. (vim.api.nvim_get_mode) :mode))]
    (case mode
	  :n "RW"
	  :no "RO"
	  :v "**"
	  :V "**"
	  "\022" "**"
	  :s "S"
	  :S "SL"
	  "\019" "SB"
	  :i "**"
	  :ic "**"
	  :R "R"
	  :Rv "RV"
	  :c "VIEX"
	  :cv "VIEX"
	  :ce "EX"
	  :r "r"
	  :rm "r"
	  "r?" "r"
	  "!" "!"
	  :t ""
	  _ "[?]")))

(fn get-diagnostic [kind]
  "Returns the LSP diagnostic count within a specific severity, or 0 if fails."
  (let [(ok res) (pcall vim.diagnostic.get 0 {:severity kind})]
    (when ok (length res) 0)))

(fn build-sections [?mode]
  "Returns a complete built status line to be used."
  (let [devicons (require :nvim-web-devicons)
		 mode           (or ?mode (. (vim.api.nvim_get_mode) :mode))
		 file-name      (or (and (= (vim.fn.expand "%") "") " [Empty] ") (.. " " (vim.fn.expand "%:t") " "))
		 file-type      (: "%%#Normal# %s %s" :format (vim.bo.filetype:gsub "^%l" string.upper) (devicons.get_icon file-name (vim.fn.expand :%:e) {:default true}))
		 file-info      (.. "%#Normal#" file-name)
		 bufnr          (.. "%#Comment##" (vim.api.nvim_get_current_buf))
		 branch         (or vim.b.gitsigns_status_dict {:head ""})
		 git-status     (if (= branch.head "") branch.head (.. "%#Normal#" (string.format "( • %s) " branch.head)))
		 lsp-diagnostic (: "%%#StatusLineDiagnosticWarn#%s %%#StatusLineDiagnosticError#%s" :format
				   (get-diagnostic vim.diagnostic.severity.WARN)
				   (get-diagnostic vim.diagnostic.severity.ERROR))]
    {:status-line (table.concat [(get-mode-color mode)
				 (string.format " %s " (get-mode-display-name mode))
				 file-info git-status bufnr :%= lsp-diagnostic file-type])
    :winbar (.. "%#Comment#" (if (or vim.bo.modified false) " • %f " " %f "))}))
 
(fn post-install []
  "A post-install hook setting up the status line for all buffers."
  (local status-exclude [:help :Lazy])
  (set! laststatus 3)
  (set! cmdheight 0)
  (augroup! display-status-line (clear!)
            (autocmd! [BufEnter WinEnter ModeChanged] * 
                      `(when (and (= vim.bo.buftype "") (not (vim.tbl_contains status-exclude vim.bo.filetype))) 
                         (let [built (build-sections)]
                           (set! local.statusline built.status-line))) 
                      {:desc "Display status line."})
            (autocmd! [BufLeave WinLeave] *
                      `(when (and (= vim.bo.buftype "") (not (vim.tbl_contains status-exclude vim.bo.filetype)))
                         (set! local.statusline " %F"))
                      {:desc "Hide status line."}))
  (augroup! display-win-bar (clear!)
            (autocmd! [BufEnter WinEnter] * `(when (and (= vim.bo.buftype "") (not (vim.tbl_contains status-exclude vim.bo.filetype)))
                                               (let [built (build-sections)] 
                                                 (set! local.winbar built.winbar)))
                      {:desc "Display win bar."})))

{: post-install}
