local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

indent_blankline.setup({
  buftype_exclude = { "terminal", "alpha", "alpha-nvim", "nofile" },
  filetype_exclude = { "lspinfo", "NvimTree", "packer", "alpha", "alpha-nvim", "nofile" },
  show_end_of_line = true,
  show_current_context = true,
})
