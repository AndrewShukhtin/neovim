local ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

treesitter_config.setup({
  ensure_installed = { "go", "typescript", "javascript", "lua", "php" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  },
})
