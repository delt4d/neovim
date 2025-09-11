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

    -- Enhanced capabilities including file operations
    local enhanced_capabilities = vim.tbl_deep_extend(
      "force",
      capabilities,
      require('lsp-file-operations').default_capabilities()
    )

    -- Don't modify the global default config - it can cause issues
    local servers = require("shared.globals").lsp_servers

    for _, server in ipairs(servers) do
      if server == "lua_ls" then
        lspconfig.lua_ls.setup({
          capabilities = enhanced_capabilities,
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
              },
              diagnostics = {
                globals = { 'vim' },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        })
      else
        lspconfig[server].setup({
          capabilities = enhanced_capabilities
        })
      end
    end

    -- Define diagnostic signs in a modern way
    local signs = {
      Error = "󰅚 ",
      Warn  = "󰀪 ",
      Hint  = "󰌶 ",
      Info  = "󰋽 ",
    }

    vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN]  = signs.Warn,
          [vim.diagnostic.severity.HINT]  = signs.Hint,
          [vim.diagnostic.severity.INFO]  = signs.Info,
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end,
}
