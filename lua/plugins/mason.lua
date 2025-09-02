return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp", -- so we can inject cmp capabilities
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- Setup mason with extra registries
    mason.setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✅",
          package_pending = "⏳",
          package_uninstalled = "❌"
        }
      },
    })

    mason_lspconfig.setup({
      ensure_installed = require("shared.globals").lsp_servers
    })
  end,
}
