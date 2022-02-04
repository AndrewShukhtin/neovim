local wk = require('which-key')
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = {enabled = false, suggestions = 20},
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false
    }
  }
}

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({direction = "float"})
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({cmd = 'lazygit', direction = "float"})
  return lazygit:toggle()
end

local mappings = {
  q = {":q<cr>", "Quit"},
  Q = {":wq<cr>", "Save & Quit"},
  w = {":w<cr>", "Save"},
  x = {":bdelete<cr>", "Close Buffer"},
  E = {":e ~/.config/nvim/init.lua<cr>", "Edit Config File"},
  e = {":NvimTreeToggle<cr>", "Open File Explorer"},
  f = {
    name = "Telescope",
    f = {"<cmd>Telescope find_files<cr>", "Find Files"},
    r = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
    b = {"<cmd>Telescope buffers<cr>", "Buffers"},
    o = {"<cmd>Telescope oldfiles<cr>", "Recent Files"}
  },
  t = {
    t = {":ToggleTerm<cr>", "Split Below"},
    f = {toggle_float, "Floating Terminal"},
    l = {toggle_lazygit, "LazyGit"}
  },
  l = {
    name = "LSP",
    I = {":LspInfo<cr>", "Connected Language Servers"},
    i = {'<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', "Implementation"},
    k = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Documentation"},
    K = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help"},
    t = {'<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>', "Type Definition"},
    d = {'<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', "Go To Definition"},
    D = {'<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration"},
    r = {'<cmd>lua require("telescope.builtin").lsp_references()<cr>', "References"},
    R = {'<cmd>Lspsaga rename<cr>', "Rename"},
    a = {'<cmd>Lspsaga code_action<cr>', "Code Action"},
    e = {'<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics"},
    n = {'<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic"},
    N = {'<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic"}
  },
}

local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
