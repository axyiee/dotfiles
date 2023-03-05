(local {: str? : ->str : tbl? : fn? : nil?} (require :ocean.helpers.types))
(local {: car : all} (require :ocean.helpers.luafun))

(lambda expand-exprs [exprs]
  "Executes either a single or a list of expressions."
  (if (> (length exprs) 1) `(do ,(unpack exprs)) (car exprs)))

(lambda quoted? [element]
  "Returns whether `element` is an inline/quoted code definition. Inline code definitions are 
   given by expressions prefixed by a quote."
  (and (list? element) (= `quote (car element))))

(lambda quoted->fn [element]
  "Converts an inline/quoted code definition to a function. Inline code definitions are given by
   expressions prefixed by a quote."
  (assert-compile (quoted? element) "expected quoted element" element)
  (let [body (. element 2)]
    `(fn [] ,body)))

(lambda sym-seq? [seq]
  "Checks whether a sequence is a sequence of symbols."
  (and (tbl? seq) (all #(sym? $) seq)))

(lambda ->sym-seq [elem]
  "Converts a table of symbols into a stringified sequence of symbols."
  (if (and (tbl? elem) (not (sym? elem)))
      (icollect [_ v (ipairs elem)]
	(->str v))
      (->str elem)))

(lambda begins-with! [element with]
  "Identifies whether a string starts with a specific pattern. Returns a boolean result."
  (let [element (->str element)
	pattern (string.format "^(%s)" with)]
    (~= (string.find element pattern) nil)))

(lambda remap! [[modes] lhs rhs ?opts]
  "Remaps a key combination given by lhs to the command given by rhs, followed by the given mode
   and options using the built-in vim.keymap.set API. We aren't using vim.api.nvim_set_keymap because
   it is less flexible - accepts just a single mode and only rhs as symbol. This accepts the following
   properties:
     * modes - must be a sequence of symbols, where each character of it represents
               a mode.
               Refers to which mode(s) this combination could be triggered at.
     * lhs   - must be a string.
               This must be between the accepted patterns of Vim's key combination
	      feature.
     * rhs   - must be a symbol or function.
               Similarly to `lhs`, this should be between the accepted pattern of
	      Neovim's built-in function feature.
     * ?opts - must be a table or nil.
               An optional list of options assigned to the registered key combination. 
               A description might be inferred if it is not given.
   This macro is given by an example syntax of `remap! [vi] :<C-q> :<Cmd>qa!<cr>`, which compiles
   to: `vim.keymap.set [:v :i] \"<C-q>\" \"<Cmd>qa!<cr>\" {}`"
  (assert-compile (sym? modes) "expected symbol for modes" modes)
  (assert-compile (str? lhs) "expected string for lhs" lhs)
  (assert-compile (or (str? rhs) (fn? rhs) (tbl? rhs)) "expected string or function for rhs" rhs)
  (assert-compile (or (tbl? ?opts) (nil? ?opts)) "expected table or nil for opts")
  (let [modes (icollect [char (string.gmatch (->str modes) :.)] char)
	opts (or ?opts {})
        opts (if (nil? opts.desc) (doto opts
                 (tset :desc (string.format "Remaps %s to %s in %s mode(s)." lhs rhs modes))) opts)]
    `(vim.keymap.set ,modes ,lhs ,rhs ,opts)))

(lambda set! [property ?value]
  "Modifies a Neovim built-in property value by using the Lua `vim.opt.<property>` API. This design
   choice is highly inspired by nyoom.nvim, thus I highly recommend taking a look at it as well since
   it is pretty solid! This accepts the following arguments:
     * property -> must be a symbol. 
                   If it starts with `local:`, it is going to set `vim.opt_local.<property>` 
		              instead.
		              If it ends with `+`, it will append to the value instead of changing the
		              current value directly.
                   If it ends with `-`, it will remove the value from the current value.
                   If it ends with `>`, it will prepend the value to the current value.
     * ?value   -> can be anything accepted by that vim property or nil. If nil, it is 
                   going to default to true if it doesn't start with :no, false otherwise.
   This macro is given by an example syntax of `set! signcolumn :yes:1`, which compiles to 
   `set vim.opt.signcolumn \"yes:1\"`."
  (assert-compile (sym? property) "expected symbol for property" property)
  (let [property (->str property)
	is_local     (begins-with! property :local.)
	property     (if is_local (property:match "^local.(.*)") property)
	is_no        (begins-with! property :no)
	value	      (if (nil? ?value) (not is_no) ?value)
	property     (if is_no (property:match "^no(.+)$") property)]
    (match (property:sub -1)
      :+ `(: (. (if ,is_local vim.opt_local vim.opt) ,(property:sub 1 -2)) :append ,value)
      :- `(: (. (if ,is_local vim.opt_local vim.opt) ,(property:sub 1 -2)) :remove ,value)
      :^ `(: (. (if ,is_local vim.opt_local vim.opt) ,(property:sub 1 -2)) :prepend ,value)
      _  `(tset (if ,is_local vim.opt_local vim.opt) ,property ,value))))
  
(lambda autocmd! [event pattern command ?options]
  "Defines a command that triggers automatically whenever a specific event is fired using Neovim's built-in
   vim.api.nvim_create_autocmd API. This accepts the following arguments:
     * event    -> must be either a symbol or a list of symbols.
                   The event we're listening to in order to execute a specific action.
     * pattern  -> must be either a symbol or a list of symbols.
                   The buffer pattern required to run against.
     * command  -> must be either a string, symbol, function, or a quoted expression.
                   The command to run whenever an event matching `pattern` is fired.
     * ?options -> must be a table or nil.
                   An optional list of options assigned to the autocmd handler. A 
                   description might be inferred if it is not given.
   This macro is given by an example syntax of `(autocmd :VimEnter :*.fnl >(print 5) 
                                                  {:desc \"Print 5 when entering a fennel file.\")`."
   (assert-compile (or (sym? event) (sym-seq? event)) "expected symbol or sequence for event" event)
   (assert-compile (or (sym? pattern) (sym-seq? pattern)) "expected symbol or sequence for pattern" pattern)
   (assert-compile (or (str? command) (sym? command) (fn? command) (quoted? command)) "expected string, symbol, quoted expression, or function for command" command)
   (assert-compile (or (tbl? ?options) (nil? ?options)) "expected table or nil for options")
   (let [event   (->sym-seq event)
         pattern (->sym-seq pattern)
         options (or ?options {})
         options (if (str? command)
                     (doto options
                       (tset :command command))
                     (doto options
                       (tset :callback (if (quoted? command) (quoted->fn command) command))))
         options (if (nil? options.desc) (doto options
                                           (tset :desc (string.format "Autocmd for %s event(s) on %s pattern(s)." event pattern))) options)]
     `(vim.api.nvim_create_autocmd ,event ,options)))

(lambda augroup! [name ...]
  "Defines a group of `autocmd!` by using Neovim's built-in vim.api.nvim_create_augroup API.
   This accepts the following arguments:
     * name   -> must be either a string or symbol.
                 The name of the group.
     * ...    -> must be a list of autocmd! definitions.
                 The autocmd! definitions to be grouped together.
   This macro is given by an example syntax of `(augroup! my-group
                                                  (autocmd! :VimEnter :*.fnl >(print 5) {:desc \"Print 5 when entering a fennel file.\"}))
                                                  (autocmd! :BufWritePre :*.fnl :w))`.
   All body expressions (...) must be given by a `autocmd!`, otherwise an error will be thrown."
  (assert-compile (or (sym? name) (str? name)) "expected symbol or string for name" name)
  (assert-compile (all #(and (list? $) (or (= `clear! (car $)) (= `autocmd! (car $)))) [...]) "expected autocmd expressions for body[...]" ...)
  (expand-exprs (let [name (->str name)]
                  (icollect [_ expr (ipairs [...]) &into [`(vim.api.nvim_create_augroup ,name {:clear false})]]
                    (if (= `autocmd! (car expr))
                      (let [[_ event pattern command ?options] expr
                            options (or ?options {})
                            options (doto options (tset :group name))]
                        `(autocmd! ,event ,pattern ,command ,options))
                      (let [[_ ?options] expr]
                        `(clear! ,name ,?options)))))))

(lambda clear! [name ?options]
  "Clears a group of `autocmd!` by using Neovim's built-in vim.api.clear_autocmds API.
   Accepts the following arguments:
     * name     -> must be a string or symbol.
                   The name of the group.
     * ?options -> must be a table or nil."
  (assert-compile (or (sym? name) (str? name)) "expected symbol or string for name" name)
  (assert-compile (or (tbl? ?options) (nil? ?options)) "expected table or nil for options" ?options)
  (let [name (->str name)
        options (or ?options {})
        options (doto options (tset :group name))]
    `(vim.api.nvim_clear_autocmds ,options)))

{: remap!
 : set!
 : autocmd!
 : augroup!
 : clear!}
