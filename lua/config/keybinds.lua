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

-- Detecta si estás en una sesión SSH
if vim.env.SSH_CONNECTION then
  local has_osc52, osc52 = pcall(require, "vim.ui.clipboard.osc52")
  if has_osc52 then
    vim.g.clipboard = {
      name = "osc52 (SSH)",
      copy = {
        ["+"] = osc52.copy,
        ["*"] = osc52.copy,
      },
      paste = {
        ["+"] = osc52.paste,
        ["*"] = osc52.paste,
      },
    }
    vim.notify("📋 Clipboard: OSC52 activado (SSH)", vim.log.levels.INFO)
    vim.g.oscyank_term = 'default'
    vim.keymap.set('n', '<leader>c', '<Plug>OSCYankOperator', {silent = true})
    vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true, silent = true})
    vim.keymap.set('v', '<leader>c', '<Plug>OSCYankVisual', {silent = true})
  else
    vim.notify("⚠️ OSC52 no disponible, usando unnamedplus", vim.log.levels.WARN)
  end
end
