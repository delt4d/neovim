return {
   "VonHeikemen/lsp-zero.nvim",
   branch = "v3.x",
   dependencies = {
      --- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      { "onsails/lspkind.nvim" }, -- VS Code-like pictograms
   },
   config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
         -- Set up keymaps here
         local opts = { buffer = bufnr, remap = false }
         vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
         vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end)

      -- Configure nvim-cmp here or use lsp-zero’s preset
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      require('lsp-zero').setup({
         cmp = {
            mapping = {
               ['<CR>'] = cmp.mapping.confirm({ select = true }),
               ['<Tab>'] = cmp_action.luasnip_supertab(),
               ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
            }
         }
      })

      -- Autocomplete UI
      local lspkind = require("lspkind")
      cmp.setup({
         formatting = {
            format = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 })
         }
      })

      -- Configure mason and mason-lspconfig
      require('mason-lspconfig').setup({
         ensure_installed = { 'lua_ls', 'pyright', 'ts_ls' }, 
         handlers = {
            lsp_zero.default_setup,
         },
      })
   end
}
