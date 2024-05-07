-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    -- none-ls (community fork of null-ls) for linting
    'nvimtools/none-ls.nvim',
    event = 'VimEnter',
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.markdownlint_cli2.with { args = { '$FILENAME' } },
        },
        debug = true,
      }
    end,
  },
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', 's', '<Plug>(leap-forward)')
      vim.keymap.set('n', 'S', '<Plug>(leap-backward)')
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>lg', vim.cmd.LazyGit, { desc = 'Open [L]azy[G]it' })
    end,
  },
  {
    'bluz71/vim-moonfly-colors',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'moonfly'
    end,
  },
  {
    'https://github.com/mzlogin/vim-markdown-toc.git',
    init = function()
      vim.g.vmt_fence_text = 'markdown-toc-start'
      vim.g.vmt_fence_closing_text = 'markdown-toc-end'
      vim.g.vmt_list_item_char = '-'
      vim.g.vmt_list_indent_text = '  '
    end,
  },
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup {
        auto_load = false,
        theme = 'light',
        app = 'webview',
        filetype = { 'markdown' },
      }
      vim.api.nvim_create_user_command('Peek', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
}
