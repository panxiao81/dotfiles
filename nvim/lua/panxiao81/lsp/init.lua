local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("panxiao81/lsp/lsp-installer")
require("panxiao81/lsp/handlers").setup()

