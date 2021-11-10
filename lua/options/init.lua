local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt

opt.swapfile = false
opt.backup = false
opt.hidden = true
opt.number = true
opt.relativenumber = true
opt.colorcolumn = '80'
opt.clipboard ='unnamedplus'
opt.list = true
opt.scrolloff = 15
opt.listchars = {eol = '↲', tab = '▸·', space = '·'}
opt.signcolumn = 'yes'
opt.mouse = 'v'
opt.mouse = 'a'
opt.hlsearch = false
opt.incsearch = true
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.splitright = true
opt.splitbelow = true
cmd([[
filetype indent plugin on
syntax enable
set number
set relativenumber
set signcolumn=yes
]])

-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja set number relativenumber signcolumn=yes 
]]
cmd [[
autocmd FileType go set number relativenumber signcolumn=yes
]]
