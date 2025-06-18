vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Oil)
vim.keymap.set("n", "<leader>jk", vim.cmd.w)
vim.keymap.set("n", "<leader>jq", vim.cmd.x)
vim.keymap.set("n", "<leader>t", vim.cmd.FloatermToggle)
vim.keymap.set("n", "<leader>nh", vim.cmd.noh)
vim.keymap.set("n", "<leader>kk", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })

vim.g.clipboard = {
  name = 'osc52',
  copy = {
    ["+"] = require('vim.ui.clipboard.osc52').copy,
    ["*"] = require('vim.ui.clipboard.osc52').copy,
  },
  paste = {
    ["+"] = require('vim.ui.clipboard.osc52').paste,
    ["*"] = require('vim.ui.clipboard.osc52').paste,
  },
}
vim.g.oscyank_term = 'default'
vim.keymap.set('n', '<leader>c', '<Plug>OSCYankOperator', {silent = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true, silent = true})
vim.keymap.set('v', '<leader>c', '<Plug>OSCYankVisual', {silent = true})
vim.keymap.set('n', 'q', '<Nop>', { noremap = true })
