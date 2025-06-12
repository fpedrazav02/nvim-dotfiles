return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config       = function()
        require("oil").setup({
            default_file_explorer         = true,
            columns                       = {
                "icon",
            },
            keymaps                       = {
                ["q"] = "actions.close"
            },
            delete_to_trash               = true,
            view_options                  = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil",
            callback = function()
                vim.opt_local.cursorline = true
            end
        })
    end
}
