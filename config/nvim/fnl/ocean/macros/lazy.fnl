(local {: str? : tbl? : nil?} (require :ocean.macros.types))

(lambda lazy-plugin [identifier ?options]
  "A workaround for defining a lazy.nvim plugin. The reason why this is being used instead of
  using vanilla Fennel types into an already existing 'require' local, is that Fennel doesn't
  have support for mixed tables (mixing tables with sequential and named values).
  The arguments are [identifier ?options]. Following, the { 'identifier', ...options } format,
  where the options object expect you to pass the same entries as lazy.nvim does in plain Lua."
  (assert-compile (str? identifier) "expected string for identifier" identifier)
  (assert-compile (or (nil? ?options) (tbl? ?options)) "expected table for options" ?options)
  (let [options (or ?options {})]
    (doto options
      (table.insert identifier))))

{: lazy-plugin}
