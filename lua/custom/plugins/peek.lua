return {
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
}
