(local {: load-module : finish} (require :ocean.loader))
(local {: nil?} (require :ocean.macros.types))

"The holding context for all modules to be loaded."
(var M nil)

(fn $load-module [name]
  "Loads a module and sets module registry back."
  (let [module (.. :ocean.components. name) component (require module)]
    (if (nil? component.lazy) (component.post-install) (set M (load-module module M)))))

(let [profile [:leader :language-server :formatting :treesitter]]
  (each [_ component (pairs profile)]
    ($load-module component))
  (finish M))
