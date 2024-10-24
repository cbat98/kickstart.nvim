return {
  'chrisgrieser/nvim-origami',
  event = 'VeryLazy',
  opts = {
    keepFoldsAcrossSessions = false,
    hOnlyOpensOnFirstColumn = true,
  },
  init = function()
    vim.opt.foldlevelstart = 99
    vim.opt.foldmethod = 'indent'
  end,
}
