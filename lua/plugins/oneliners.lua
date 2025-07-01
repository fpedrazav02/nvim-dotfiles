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
    -- UndoTree
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    -- Copy over ssh
    {
        'ojroques/nvim-osc52',
        config = function()
            require('osc52').setup({
                max_length = 0, -- 0 = no limit
                silent = false, -- not silent = show messages
                trim = false,   -- no trim of leading/trailing lines
            })
        end
    }
    , -- Surround
    {
        "echasnovski/mini.surround",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            custom_surroundings = nil,

            highlight_duration = 300,

            mappings = {
                add = 'sa',            -- Add surrounding in Normal and Visual modes
                delete = 'ds',         -- Delete surrounding
                find = 'sf',           -- Find surrounding (to the right)
                find_left = 'sF',      -- Find surrounding (to the left)
                highlight = 'sh',      -- Highlight surrounding
                replace = 'sr',        -- Replace surrounding
                update_n_lines = 'sn', -- Update `n_lines`

                suffix_last = 'l',     -- Suffix to search with "prev" method
                suffix_next = 'n',     -- Suffix to search with "next" method
            },

            n_lines = 20,
            respect_selection_type = false,
            search_method = 'cover',
            silent = false,
        },
    },
    -- Get rid of whitespace
    {
        "echasnovski/mini.trailspace",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local miniTrailspace = require("mini.trailspace")

            miniTrailspace.setup({
                only_in_normal_buffers = true,
            })
            vim.keymap.set("n", "<leader>cw", function() miniTrailspace.trim() end, { desc = "Erase Whitespace" })
            vim.api.nvim_create_autocmd("CursorMoved", {
                pattern = "*",
                callback = function()
                    require("mini.trailspace").unhighlight()
                end,
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        },
        keys = {
            { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Open TODO list in Telescope" },
        },
        config = function()
            require("todo-comments").setup()
        end
    }
}
