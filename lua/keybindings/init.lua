vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

-- For moving between different splits you can use c-h c-j c-k c-l
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

-- Map jk or kj to escape from insert mode
map('i', 'jk', '<ESC>', {noremap = true, silent = true})
map('i', 'kj', '<ESC>', {noremap = true, silent = true})


-- Makes indentation better
map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})

-- NOTE: from @chris repo
-- Naviagate buffers
-- map("n", "<S-l>", ":bnext<CR>", {noremap = true, silent = true})
-- map("n", "<S-h>", ":bprevious<CR>", {noremap = true, silent = true})

-- Move between buffers
map('n', '<TAB>', ":bnext<cr>", {noremap = true, silent = true})
map('n', '<S-TAB>', ":bprevious<cr>", {noremap = true, silent = true})

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", {noremap = true, silent = true})
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", {noremap = true, silent = true})
map("v", "p", '"_dP', {noremap = true, silent = true})

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", {noremap = true, silent = true})
map("x", "K", ":move '<-2<CR>gv-gv", {noremap = true, silent = true})
map("x", "<A-j>", ":move '>+1<CR>gv-gv", {noremap = true, silent = true})
map("x", "<A-k>", ":move '<-2<CR>gv-gv", {noremap = true, silent = true})

