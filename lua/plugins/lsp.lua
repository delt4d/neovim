return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    -- Common on_attach function for LSP clients
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Definitions
      vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)             -- Show hover info
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)       -- Go to definition

      -- Diagnostics
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)     -- Show line diagnostics
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, opts)      -- Show all diagnostics
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)             -- Next diagnostic
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)             -- Previous diagnostic

      -- Additional LSP actions
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)               -- Show references
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)           -- Go to implementation
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)           -- Rename symbol
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)      -- Code actions
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)            -- Format document
    end

    local servers = require("shared.globals").lsp_servers

    -- Set global defaults for all servers
    lspconfig.util.default_config = vim.tbl_extend(
      'force',
      lspconfig.util.default_config,
      {
        capabilities = vim.tbl_deep_extend(
          "force",
          vim.lsp.protocol.make_client_capabilities(),
          -- returns configured operations if setup() was already called
          -- or default operations if not
          require 'lsp-file-operations'.default_capabilities()
        )
      })

    for _, server in ipairs(servers) do
      if server == "lua_ls" then
        lspconfig.lua_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        })
      else
        lspconfig[server].setup({
          on_attach = on_attach,
          capabilities = capabilities
        })
      end
    end
  end,
}
