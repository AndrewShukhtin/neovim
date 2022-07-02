local wk = require("which-key")
wk.setup({
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    },
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

local Terminal = require("toggleterm.terminal").Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      local opts = {noremap = true}
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[]], opts)
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      local opts = {noremap = true}
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end,
  })
  return lazygit:toggle()
end

local n_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local v_opts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local n_mappings = {
  a = { "<cmd>Alpha<cr>", "Alpha" },
  q = { ":q<cr>", "Quit" },
  Q = { ":wq<cr>", "Save & Quit" },
  w = { ":w<cr>", "Save" },
  x = { "<cmd>Bdelete!<cr>", "Close Buffer" },
  E = { ":e ~/.config/nvim/init.lua<cr>", "Edit Config File" },
  e = { ":NvimTreeToggle<cr>", "Open File Explorer" },
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    o = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
  },
  t = {
    name = "Terminal",
    ["1"] = { ":1ToggleTerm size=14<cr>", "#1" },
    ["2"] = { ":2ToggleTerm size=14<cr>", "#2" },
    ["3"] = { ":3ToggleTerm size=14<cr>", "#3" },
    ["4"] = { ":4ToggleTerm size=14<cr>", "#4" },
    ["f1"] = { "<cmd>1ToggleTerm direction=float<cr>", "Floating Terminal #1" },
    ["f2"] = { "<cmd>2ToggleTerm direction=float<cr>", "Floating Terminal #2" },
    ["f3"] = { "<cmd>1ToggleTerm direction=float<cr>", "Floating Terminal #3" },
    ["f4"] = { "<cmd>2ToggleTerm direction=float<cr>", "Floating Terminal #4" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  l = {
    name = "LSP",
    I = { ":LspInfo<cr>", "Connected Language Servers" },
    i = { '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', "Implementation" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
    k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Documentation" },
    K = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
    t = { '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>', "Type Definition" },
    d = { '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', "Go To Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
    r = { '<cmd>lua require("telescope.builtin").lsp_references()<cr>', "References" },
    R = { "<cmd>Lspsaga rename<cr>", "Rename" },
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
    n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
    N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
  },
  g = {
    name = "Git",
    g = { toggle_lazygit, "LazyGit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>GitBlameToggle<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },
}

local v_mappings = {
  g = {
    name = "Git",
    s = {
      '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>',
      "Stage hunk",
    },
    r = {
      '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>',
      "Reset hunk",
    },
  },
}

wk.register(n_mappings, n_opts)
wk.register(v_mappings, v_opts)
