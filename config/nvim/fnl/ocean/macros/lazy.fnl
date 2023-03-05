(local {: str? : ->str : tbl? : fn? : nil?} (require :ocean.helpers.types))
(local {: car : all} (require :ocean.helpers.luafun))

(tset _G :ocean/loaded [])
(tset _G :ocean/standalone/loaded [])

(lambda expand-exprs [exprs]
  "Executes either a single or a list of expressions."
  (if (> (length exprs) 1) `(do
                              ,(unpack exprs))
      (car exprs)))

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

(lambda component->loaded? [name]
  "Returns true if the component with the given `name` is already loaded."
  (each [_ component (ipairs _G.ocean/loaded)]
    (when (= component.id name)
      (lua "return true")))
  false)

(lambda define-standalone! [identifier]
  "Registers a component dependent on core Neovim features only. This accepts the following arguments:
    * identifier - must be a string.
    * ...        - must be a block of code."
  (assert-compile (str? identifier) "expected string for identifier" identifier)
  `(table.insert _G.ocean/standalone/loaded {:id ,identifier}))

(lambda define-lazy! [identifier options]
  "A workaround for defining a lazy.nvim plugin. The reason why this is being used instead of
  using vanilla Fennel types into an already existing 'require' local, is that Fennel doesn't
  have support for mixed tables (mixing tables with sequential and named values).
  The arguments are [identifier ?options]. Following, the { 'identifier', ...options } format,
  where the options object expect you to pass the same entries as lazy.nvim does in plain Lua."
  (assert-compile (str? identifier) "expected string for identifier" identifier)
  (assert-compile (tbl? options) "expected table for options" options)
  (assert-compile (str? (. options :component))
                  "expected string for options.component" options)

  (fn clone-lazy [this]
    `{1 ,(. this.lazy 1)
      :dependencies ,(or (. this.lazy :dependencies) [])
      :cmd ,(. this.lazy :cmd)
      :event ,(. this.lazy :event)
      :config (fn []
                (let [component# (require ,(.. :ocean.components. this.id))]
                  (component#.post-install)))
      :cond ,(. this.lazy :cond)
      :build ,(. this.lazy :build)
      :branch ,(. this.lazy :branch)
      :ft ,(. this.lazy :ft)
      :lazy ,(. this.lazy :lazy)})

  (when (component->loaded? options.component)
    (lua :return))
  (let [options (doto options
                  (tset 1 identifier))
        buffer (doto {}
                 (tset :id options.component)
                 (tset :lazy options))]
    `(table.insert _G.ocean/loaded {:id ,buffer.id :lazy ,(clone-lazy buffer)})))

(lambda build-all! [...]
  "Retrieves all registered components and pass it as an argument to the require('lazy').setup(here) API.
   This macro is given by an example syntax of `(build-all! 
\t\t(> :core)
\t\t(> editor :highlight.treesitter :code-completion.copilot])
\t\t(> ui     :file-tree))`
   where each component resolves to :ocean.components.<module>.<component name>. If a Lazy.nvim definition 
   isn't found for that module, it would just mark it as loaded then call the `component#post-install` function."
  (assert-compile (all #(and (list? $) (= `> (car $))) [...])
                  "expected autocmd expressions for body[...]" ...)

  (fn initialize-component [buffer group name]
    (let [base-name (if (nil? group) name (.. group "." name))
          component-name (.. :ocean.components. base-name)]
      `(require ,component-name)))

  (local buffer [`(tset _G :ocean/loaded [])
                 `(tset _G :ocean/standalone/loaded [])])
  (each [_ expr (ipairs [...])]
    (let [[_ group & rest] expr]
      (assert-compile (sym? group) "expected sym for group" group)
      (assert-compile (all #(str? $) rest) "expected string table for rest"
                      rest)
      (let [group (->str group)
            group (if (= group :root) nil group)]
        (each [_ name (ipairs rest)]
          (table.insert buffer (initialize-component buffer group (->str name)))))))
  (table.insert buffer
                `(do
                   (let [everything# (icollect [_# this# (ipairs _G.ocean/loaded)]
                                       this#.lazy)
                         _# (icollect [_# this# (ipairs _G.ocean/standalone/loaded)]
                              (let [module# (require (.. :ocean.components.
                                                         this#.id))]
                                (module#.post-install)))]
                     ((. (require :lazy) :setup) [{1 :rktjmp/hotpot.nvim}
                                                  (unpack everything#)]))))
  (expand-exprs buffer))

(lambda setup! [identifier ?opts]
  "An alternative for requiring a Lua module then calling #.setup on it. This accepts the
   following arguments:
    * identifier - must be a symbol or string.
    * ?opts      - a table or nil."
  (assert-compile (or (sym? identifier) (str? identifier))
                  "expected symbol or string for identifier" identifier)
  (assert-compile (or (nil? ?opts) (tbl? ?opts))
                  "expected table or nil for ?opts" ?opts)
  (let [identifier (->str identifier)
        opts (if (nil? ?opts) {} ?opts)]
    `(let [module# (require ,identifier)]
       (module#.setup ,opts))))

{: setup!
 : define-lazy!
 : define-standalone!
 : component->loaded?
 : build-all!}
