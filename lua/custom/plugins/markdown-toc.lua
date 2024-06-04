return {
  'https://github.com/mzlogin/vim-markdown-toc.git',
  init = function()
    vim.g.vmt_fence_text = 'markdown-toc-start'
    vim.g.vmt_fence_closing_text = 'markdown-toc-end'
    vim.g.vmt_list_item_char = '-'
    vim.g.vmt_list_indent_text = '  '
  end,
}
