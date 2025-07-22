vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Oil)
vim.keymap.set("n", "<leader>jk", vim.cmd.w)
vim.keymap.set("n", "<leader>jq", vim.cmd.x)
vim.keymap.set("n", "<leader>t", vim.cmd.FloatermToggle)
vim.keymap.set("n", "<leader>nh", vim.cmd.noh)
vim.keymap.set("n", "<leader>kk", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })

-- Deactivate macros with q
vim.keymap.set('n', 'q', '<Nop>', { noremap = true })

-- Usa pbcopy/pbpaste por defecto (macOS local)
vim.opt.clipboard = "unnamedplus"
