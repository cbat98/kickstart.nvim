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
      }
    end,
  },

  {
    'toppair/peek.nvim',
    event = 'VeryLazy',
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup {
        auto_load = false,
        theme = 'light',
        app = 'browser',
      }
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
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
    'navarasu/onedark.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup()
    end,
    opts = function()
      vim.opt.shell = vim.fn.executable 'powershell' and 'powershell' or 'bash'
      vim.opt.shellcmdflag =
        '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
      vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
      vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
      vim.opt.shellquote = ''
      vim.opt.shellxquote = ''
    end,
    {
      'https://github.com/mzlogin/vim-markdown-toc.git',
      init = function()
        vim.g.vmt_fence_text = 'markdown-toc-start'
        vim.g.vmt_fence_closing_text = 'markdown-toc-end'
        vim.g.vmt_list_item_char = '-'
        vim.g.vmt_list_indent_text = '  '
      end,
    },
  },
}
