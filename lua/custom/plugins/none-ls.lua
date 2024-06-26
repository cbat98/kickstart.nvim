return {
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
}
