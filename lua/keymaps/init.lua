local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

map('n', '<leader>]', ':tabnext<CR>', default_opts)
map('c', '<leader>]', ':tabnext<CR>', default_opts)

map('n', '<leader>[', ':tabprev<CR>', default_opts)
map('c', '<leader>[', ':tabprev<CR>', default_opts)

map('n', 'ps', ":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For >  \" )})<CR>", default_opts)

map('i', '<S-TAB>', '<C-d>', default_opts)
map('v', '<S-TAB>', '<<', default_opts)

