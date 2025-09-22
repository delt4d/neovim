return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { "onsails/lspkind.nvim" },       -- VS Code-like pictograms
    { 'L3MON4D3/LuaSnip' },
    { "saadparwaiz1/cmp_luasnip" },   -- Snippet source for nvim-cmp
    { 'windwp/nvim-autopairs' }
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )

    cmp.setup({
      completion = {
        -- autocomplete = false, -- Disable automatic completion popup
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { "menu", "abbr", "kind" },
        format = lspkind.cmp_format({ 
          mode = "symbol_text",
          maxwidth = 50,
          before = function (entry, item)
            local menu_icon = {
              nvim_lsp = "λ",
              luasnip = "⋗",
              buffer = "Ω",
              path = "🖫",
            }
					  item.menu = menu_icon[entry.source.name]
            return item
          end
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),

        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if luasnip.expandable() then
              luasnip.expand()
            else
              cmp.confirm({
                select = true,
              })
            end
          else
            fallback()
          end
        end),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      }, {
				{ name = "buffer" },
			}),
      window = {
				documentation = cmp.config.window.bordered(),
			},
    })
  end,
}
