return {
    {
        -- LSP Installer
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",       -- Lua
                    "basedpyright", -- Python
                    "ts_ls",        -- Typescript
                },
                automatic_installation = false,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Función para asignar keymaps y autocmd por buffer
            local on_attach = function(_, bufnr)
                local map = function(mode, lhs, rhs)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
                end

                -- Navegación
                map("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
                map("n", "gr", "<cmd>Telescope lsp_references<CR>")
                map("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
 
                -- Ayuda / info
                map("n", "K", vim.lsp.buf.hover)
                map("n", "<leader>rn", vim.lsp.buf.rename)
                map("n", "<leader>cA", vim.lsp.buf.code_action)

                -- Diagnóstico
                map("n", "[d", vim.diagnostic.goto_prev)
                map("n", "]d", vim.diagnostic.goto_next)
                map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")


                vim.keymap.set('n', '<leader>KP', function()
                    vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
                end, { desc = 'Mostrar diagnóstico flotante' })
            end

            -- Add lsp not handled by Mason
            local servers = {}
            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end
        end,
    },
}
