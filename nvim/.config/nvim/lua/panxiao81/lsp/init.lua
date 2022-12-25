local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("panxiao81/lsp/mason")
require("panxiao81/lsp/handlers").setup()
require("panxiao81/lsp/null-ls")

