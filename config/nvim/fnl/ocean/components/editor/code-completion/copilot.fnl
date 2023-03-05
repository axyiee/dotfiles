(import-macros {: define-lazy!} :ocean.macros.lazy)

(define-lazy! :zbirenbaum/copilot.lua {:component :editor.code-completion.copilot
                                       :event :InsertEnter})

(fn post-install []
  "A post-installation hook that enables **proprietary** AI-based code completion for Neovim."
  (let [copilot (require :copilot)]
    (copilot.setup {:suggestion {:enabled false}
                    :panel {:enabled false}
                    :auto_refresh true})))

{: post-install}
