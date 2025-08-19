return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp", -- so we can inject cmp capabilities
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    -- Setup mason with extra registries
    mason.setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    })

    -- Common on_attach function for LSP clients
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Keymaps for LSP
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      -- In insert mode, Ctrl-k to show hover (leave insert mode temporarily)
      vim.keymap.set("i", "<C-k>", function()
        vim.lsp.buf.hover()
      end, { silent = true })
    end

    -- nvim-cmp supports LSP capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Setup mason-lspconfig
    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "pyright" },
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
      },
    })
  end,
}
