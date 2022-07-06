local ok, telescope = pcall(require, "telescope")
if not ok then return end

telescope.setup {
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
}

telescope.load_extension('fzy_native')