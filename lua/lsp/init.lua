local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require('lsp/cmp')
require('lsp/diagnostic_signs')
require('lsp/language_servers')
require('lsp.lsp_signature')
require('lsp.handlers').setup()
