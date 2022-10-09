local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

telescope.setup({
    pickers = {
        find_files = {
            theme = "dropdown",
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netrw = false,
        },
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    },
})

telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension("media_files")
