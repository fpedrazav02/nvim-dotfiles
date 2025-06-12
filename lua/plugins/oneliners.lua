return {
    { -- Git plugin
        'tpope/vim-fugitive',
    },
    { -- Show CSS Colors
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    { -- Autoclose brackets and ()
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    -- Terminal
    {
        'voldikss/vim-floaterm',
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    }
}
