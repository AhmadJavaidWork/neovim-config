return {
  'nvim-telescope/telescope.nvim', tag = 'v0.2.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", ".git/" },
      get_status_text = function(self)
        return ""
      end,
    }
  },
  config = function ()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })
  end,
}
