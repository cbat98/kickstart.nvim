-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
}
