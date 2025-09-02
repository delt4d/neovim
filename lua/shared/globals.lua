local M = {}

-- Setup LSP servers manually after mason-lspconfig
M.lsp_servers = { "lua_ls", "pyright", "cssls", "html", "jsonls", "ts_ls" }

return M