(local {: tbl? : nil? : fn? : bool? : ->bool} (require :ocean.macros.types))

(lambda merge [t1 t2 ?seq]
  (assert (or (nil? ?seq) (bool? ?seq)) "expected nil or bool for seq" ?seq)
  (if (->bool ?seq) [t1 (table.unpack t2)] { (table.unpack t1) (table.unpack t2) }))

(fn comp? [x]
  "Checks if [x] parameter matches component table model."
  (assert (tbl? x) "expected table for x" x)
  (assert (or (nil? x.post-install) (fn? x.post-install)) "expected nil or function for x.post-install" x)
  (assert (fn? x.lazy "expected function for x.lazy" x))
  true)

(lambda load-module [path ?M]
  "Appends a component to the list of modules to be loaded."
  (assert (or (nil? ?M) (tbl? ?M)) "expected nil or table for M" ?M)
  (let [modules (or ?M {}) component (require (.. "ocean." path))]
    (assert (comp? component) "expected table for component" component)
    (let [result (component.lazy)]
      	(tset result :config component.post-install)
	(let [final {}]
	  (each [module (pairs modules)]
	    (table.insert final module))
	  (table.insert final result) final) result)))

(lambda finish [M ?opts]
  "Finally, tells lazy.nvim to lazy-load all components."
  (assert (or (nil? ?opts) (tbl? ?opts)) "expected nil or table for opts" ?opts)
  (let [lazy (require :lazy) opts (or ?opts {})]
    (lazy.setup M opts)))

(lambda load-all [out ?opts]
  "Loads all components recursively."
  (assert (or (nil? ?opts) (tbl? ?opts)) "expected nil or table for opts" ?opts)
  (assert (tbl? out) "expected table for out" out)
  (let [profile [:components.treesitter]
	matches (= (length out) (length profile))
	index (+ (length out) 1)]
    (if matches (finish profile ?opts) (load-module (. profile index) out))))

{: load-module
 : load-all
 : finish}
