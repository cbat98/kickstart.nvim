return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    require('oil').setup {
      columns = { 'icon' },
    }
    vim.keymap.set('n', '-', vim.cmd.Oil, { desc = 'Oil' })
  end,
}
