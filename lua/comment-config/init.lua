local ok, nvim_comment = pcall(require, "nvim_comment")
if not ok then
  return
end

nvim_comment.setup({
  line_mapping = "<leader>cl",
  operator_mapping = "<leader>c",
  comment_empty = false,
})
