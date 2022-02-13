local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("configs.lsp.handlers").on_attach,
    capabilities = require("configs.lsp.handlers").capabilities,
  }

  -- Apply AstroVim server settings (if available)
  local present, av_overrides = pcall(require, "configs.lsp.server-settings." .. server.name)
  if present then
    opts = vim.tbl_deep_extend("force", av_overrides, opts)
  end

  server:setup(opts)
end)
