(local {: load-module : finish} (require :ocean.loader))
(local {: nil? } (require :ocean.macros.types))

"The holding context for all modules to be loaded."
(var M {})
(fn load [name]
  "Loads a module and sets module registry back."
  (let [component (require (.. "ocean." name))]
    (if (nil? component.lazy) (component.post-install) (set M (load-module name M)))))

(let [profile [:components.leader :components.treesitter]]
  (each [_ component (pairs profile)]
    (load component)))
(finish M)
