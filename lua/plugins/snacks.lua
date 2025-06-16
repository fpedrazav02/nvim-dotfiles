return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
       explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = {
            enabled = true,
            lsp = {
                progress = true,
                messages = true,
                diagnostics = false,
            },
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },

    keys = {
        { "<leader>gb", function() Snacks.gitbrowse() end,   desc = "Git Browse", mode = { "n", "v" } },
        { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Git log " },
        {
            "<leader>lg",
            function() Snacks.lazygit() end,
            desc = "Lazygit"
        },
        { "<leader>z",  function() Snacks.zen() end,                                           desc = "Toggle Zen Mode" },
        { "<leader>un", function() Snacks.notifier.hide() end,                                 desc = "Dismiss All Notifications" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end }
    }
}
