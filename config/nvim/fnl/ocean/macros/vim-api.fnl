(local {: str? : tbl? : nil?} (require :ocean.macros.types))

(lambda key-map [mode lhs rhs ?opts]
  "Remaps a key combination given by lhs to the command given by rhs, followed by the given mode 
   and options."
  (assert (str? mode) "expected string for mode")
  (assert (str? lhs) "expected string for lhs")
  (assert (str? rhs) "expected string for rhs")
  (assert (or (tbl? ?opts) (nil? ?opts)) "expected table or nil for opts")
  (let [options { :noremap true } opts (or ?opts {})]
    (vim.tbl_extend :force options opts)
    (vim.api.nvim_set_keymap mode lhs rhs options)))

{: key-map}
