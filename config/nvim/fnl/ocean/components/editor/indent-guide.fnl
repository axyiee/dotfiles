(import-macros {: define-lazy!} :ocean.macros.lazy)
(require-macros :ocean.macros.vim)

(define-lazy! :lukas-reineke/indent-blankline.nvim {:component :editor.indent-guide})

(fn post-install []
  "A post-installation hook that sets up visual indentation guides."
  (set! tabstop 2)
  (set! shiftwidth 2)
  (set! softtabstop 2)
  (set! expandtab)
  (remap! [i] :<S-Tab> :<C-d> {:desc "Shift indentation to the left (de-tab)"})
  (remap! [i] :<C-Tab> :<C-t> {:desc "Shift indentation to the right (tab)"})
  (remap! [v] :<Tab> :>gv {:desc "Shift indentation to the right (tab)"})
  (remap! [v] :<S-Tab> :<gv {:desc "Shift indentation to the left (de-tab)"})
  (let [indent-blankline (require :indent_blankline)]
    (indent-blankline.setup {:show_first_indent_level true
                             :char :⋅
                             :show_trailing_blankline_indent false
                             :char_highlight_list [:IndentBlanklineIndent]})))

{: lazy
: post-install}
