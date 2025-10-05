return {
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
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
      local enhanced_capabilities = vim.tbl_deep_extend(
        "force",
        capabilities,
        require('lsp-file-operations').default_capabilities()
      )
      local servers = require("shared.globals").lsp_servers

      for _, server in ipairs(servers) do
        if server == "lua_ls" then
          vim.lsp.config('lua_ls', {
            capabilities = enhanced_capabilities,
            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          })
          vim.lsp.enable('lua_ls')
        else
          vim.lsp.config(server, {
            capabilities = enhanced_capabilities
          })
          vim.lsp.enable(server)
        end
      end

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
          }
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      })
    end
  }
}