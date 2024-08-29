return {
  'rose-pine/neovim',
  name = 'rose-pine',
  init = function()
    require('rose-pine').setup {
      variant = 'main',
      styles = {
        transparency = true,
      },
    }

    vim.cmd.colorscheme 'rose-pine'
  end,
}
