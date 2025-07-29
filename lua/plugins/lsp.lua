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

-- Init nvim-java
local java_ok, java = pcall(require, "java")
if java_ok then
  java.setup()
end

-- Servers
local servers = { "lua_ls", "basedpyright", "ts_ls", "clangd", "jdtls" }

for _, server in ipairs(servers) do
  if lspconfig[server] then
    lspconfig[server].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
end
