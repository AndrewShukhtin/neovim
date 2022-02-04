local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.black,
		formatting.gofmt,
		formatting.shfmt,
		formatting.clang_format,
		formatting.cmake_format,
		formatting.dart_format,
		formatting.stylua,
		formatting.isort,
		formatting.codespell.with({ filetypes = { "markdown" } }),
	},
	-- on_attach = function(client)
	--   if client.resolved_capabilities.document_formatting then
	--     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	--   end
	--   vim.cmd [[
	--     augroup document_highlight
	--       autocmd! * <buffer>
	--       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
	--       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
	--     augroup END
	--   ]]
	-- end
})
