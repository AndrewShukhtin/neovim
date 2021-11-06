local g = vim.g

g.nvim_tree_gitignore = 1
vim.cmd([[
  let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
]])
