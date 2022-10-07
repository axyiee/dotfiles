return {
    exec = function(_)
        -- Ignore case when searching while still being smart.
        vim.o.ignorecase = true
        vim.o.smartcase = true

        vim.o.hlsearch = true -- Highlight search results.
        vim.o.incsearch = true -- Incremental search support.
    end,
}
