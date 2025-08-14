return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim"
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Setup mason
    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "pyright", "tsserver" },
    })

    -- Setup nvim-cmp
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
      formatting = {
        format = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 }),
      },
    })

    -- Common on_attach function for LSP clients
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      -- Keymaps for LSP
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      -- In insert mode, Ctrl-k to show hover (temporary leave insert mode)
      vim.keymap.set("i", "<C-k>", function()
        vim.lsp.buf.hover()
      end, { silent = true })
    end

   require('mason-lspconfig').setup({
      on_attach,
      ensure_installed = { 'lua_ls', 'pyright', 'ts_ls' }, 
   })

  end,
}
