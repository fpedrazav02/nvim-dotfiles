return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
      local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if not (lspconfig_ok and cmp_ok) then return end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
        end

        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
        map("n", "gr", "<cmd>Telescope lsp_references<CR>")
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
        map("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>")
        map("n", "K", function() vim.lsp.buf.hover() end)
        map("n", "<leader>rn", function() vim.lsp.buf.rename() end)
        map("n", "<leader>cA", function() vim.lsp.buf.code_action() end)
        map("n", "[d", function() vim.diagnostic.goto_prev() end)
        map("n", "]d", function() vim.diagnostic.goto_next() end)
        map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")
        map("n", "<leader>KP", function()
          vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
        end)
      end

      local servers = { "lua_ls", "basedpyright", "ts_ls", "clangd" }

      for _, server in ipairs(servers) do
        if lspconfig[server] then
          lspconfig[server].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local ok, jdtls = pcall(require, "jdtls")
          if not ok then return end

          local root_markers = { ".git", "pom.xml", "build.gradle", "settings.gradle" }
          local root_dir = require("jdtls.setup").find_root(root_markers)
          if not root_dir then return end

          local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

          jdtls.start_or_attach({
            cmd = { "jdtls" },
            root_dir = root_dir,
            workspace_folders = { workspace_dir },
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end
      })
    end,
  },
}
