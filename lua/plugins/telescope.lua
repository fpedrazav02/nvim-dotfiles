return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local ok, telescope = pcall(require, 'telescope')
    if not ok then
      vim.notify('Telescope no se pudo cargar', vim.log.levels.ERROR)
      return
    end

    telescope.setup({
      defaults = {
        preview = {
          treesitter = false,
        },
      },
    })

    pcall(function()
      telescope.load_extension('fzf')
      telescope.load_extension('treesitter')
    end)

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end,
}
