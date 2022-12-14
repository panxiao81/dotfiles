local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = require("panxiao81/lsp.handlers").on_attach,
      capabilities = require("panxiao81/lsp.handlers").capabilities,
    }

     if server.name == "jsonls" then
      local jsonls_opts = require("panxiao81/lsp.settings.jsonls")
      opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
     end

     if server.name == "sumneko_lua" then
      local sumneko_opts = require("panxiao81/lsp.settings.sumneko_lua")
      opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
     end

     if server.name == "yamlls" then
        local yamlls_opts = require("panxiao81/lsp.settings.yamlls")
        opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
     end

     if server.name == "clangd" then
        opts.capabilities.offsetEncoding = 'utf-8'
     end
     if server.name == "ccls" then
        opts.offset_encoding = "utf-8"
    end
    server:setup(opts)
end)

