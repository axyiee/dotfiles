return {
    exec = function(_)
        vim.o.lazyredraw = true -- Don't redraw while executing macros for better performance.
    end,
}
