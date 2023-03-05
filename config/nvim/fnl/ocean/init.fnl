(import-macros {: build-all!} :ocean.macros.lazy)

(build-all! (> root :core) (> keybindings :leader :lsp)
            (> editor :language-server :null :code-folding :indent-guide
               :code-completion.copilot :code-completion :highlight.treesitter
               :lang.rust) (> code-checking :diagnostics.lsp-lines)
            (> integration :git)
            (> ui :status-line :file-tree :progress :theme.lushwal))
