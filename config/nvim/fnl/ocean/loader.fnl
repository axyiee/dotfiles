(local {: tbl? : nil? : fn? : bool? : ->bool} (require :ocean.macros.types))

(fn comp? [x]
  "Checks if [x] parameter matches component table model."
  (assert (tbl? x) "expected table for x" x)
  (assert (fn? x.post-install) "expected function for x.post-install" x)
  (assert (or (nil? x.lazy) (fn? x.lazy)) "expected function for x.lazy" x) true)

(lambda load-module [path ?M]
  "Appends a component to the list of modules to be loaded."
  (assert (or (nil? ?M) (tbl? ?M)) "expected nil or table for M" ?M)
  (let [modules (or ?M {}) component (require (.. "ocean." path))]
    (assert (comp? component) "expected table for component" component)
    (if (nil? component.lazy) modules
	(let [result (component.lazy)]
	  (tset result :config component.post-install)
	  (let [final {}]
	    (each [module (pairs modules)]
	      (table.insert final module))
	    (table.insert final result) final) result))))

(lambda finish [M ?opts]
  "Finally, tells lazy.nvim to lazy-load all components."
  (assert (or (nil? ?opts) (tbl? ?opts)) "expected nil or table for opts" ?opts)
  (let [lazy (require :lazy) opts (or ?opts {})]
    (lazy.setup M opts)))

{: load-module
 : finish}
