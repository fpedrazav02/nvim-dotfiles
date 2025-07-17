return {
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
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
                vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { noremap = true, silent = true })
                vim.keymap.set("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", { noremap = true, silent = true })
                
                -- Ayuda / info
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { noremap = true, silent = true })
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { noremap = true, silent = true })
                vim.keymap.set("n", "<leader>cA", function() vim.lsp.buf.code_action() end, { noremap = true, silent = true })
                
                -- Diagnóstico
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { noremap = true, silent = true })
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { noremap = true, silent = true })
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { noremap = true, silent = true })


                vim.keymap.set('n', '<leader>KP', function()
                    vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
                end, { desc = 'Mostrar diagnóstico flotante' })
            end

            -- Add lsp
            local servers = { "lua_ls", "basedpyright", "ts_ls" }
            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end
        end,
    },
}
