return {
    packer = {
        "romgrk/barbar.nvim",
    },
    api = {
        "kyazdani42/nvim-web-devicons",
    },
    data = function()
        return require("bufferline")
    end,
    exec = function(root)
        root.setup({
            animation = false,
            closable = false,
            icon_separator_inactive = "",
            insert_at_end = true,
            minimum_padding = 1,
            maximum_padding = 1,
        })
        vim.api.nvim_create_autocmd("BufWinEnter", {
            pattern = "*",
            callback = function()
                if vim.bo.filetype == "NvimTree" then
                    require("bufferline.api").set_offset(31, "FileTree")
                end
            end,
        })
        vim.api.nvim_create_autocmd("BufWinLeave", {
            pattern = "*",
            callback = function()
                if vim.fn.expand("<afile>"):match("NvimTree") then
                    require("bufferline.api").set_offset(0)
                end
            end,
        })
    end,
}
