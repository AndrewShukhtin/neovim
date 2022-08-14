local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
  return
end

-- Special settings for lua lsp server
local lua_config = {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- TODO(apshukhtin): replace usage of this deprecated method
lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = require("lsp.handlers").capabilities,
    on_attach = require("lsp.handlers").on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    handlers = require("lsp.handlers").handlers,
  }
  if server.name == "sumneko_lua" then
    -- only apply these settings for the "sumneko_lua" server
    opts.settings = lua_config.settings
  end
  server:setup(opts)
end)
