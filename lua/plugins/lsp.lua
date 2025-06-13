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
                map("n", "gd", vim.lsp.buf.definition)
                map("n", "gr", vim.lsp.buf.references)
                map("n", "gi", vim.lsp.buf.implementation)

                -- Ayuda / info
                map("n", "K", vim.lsp.buf.hover)
                map("n", "<leader>rn", vim.lsp.buf.rename)
                map("n", "<leader>ca", vim.lsp.buf.code_action)

                -- Diagnóstico
                map("n", "[d", vim.diagnostic.goto_prev)
                map("n", "]d", vim.diagnostic.goto_next)

                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = bufnr,
                    callback = function()
                        vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
                    end,
                })
            end

            -- Lista de LSPs que deseas usar
            local servers = { "lua_ls", "basedpyright" }

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end
        end,
    }

}
