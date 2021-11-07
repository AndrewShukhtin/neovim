local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

map('n', '<leader>n', ':CHADopen<CR>', default_opts)

local chadtree_settings = {
  keymap = {
    primary = {'o'},
    secondary = {},
    tertiary = {'t'},
    open_sys = {},
    trash = {},
    collapse = {},
  },
  theme = {
    text_colour_set = 'solarized_light',
  }
}

vim.api.nvim_set_var('chadtree_settings', chadtree_settings)
-- print(vim.inspect(vim.api.nvim_get_var('chadtree_settings')))

