return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    lazy = false,                    -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({
        open_files_do_not_replace_types = { "Trouble", "qf", "edgy" },
      })

      -- Toggle the tree
      vim.keymap.set('n', '<C-n>', ':Neotree toggle filesystem reveal left<CR>')

      -- Toggle filesystem specifically
      vim.keymap.set('n', '<leader>e', ':Neotree toggle filesystem reveal left<CR>', { noremap = true, silent = true })

      -- Toggle buffers view
      vim.keymap.set('n', '<leader>b', ':Neotree toggle buffers reveal left<CR>', { noremap = true, silent = true })

      -- Toggle git status view
      vim.keymap.set('n', '<leader>g', ':Neotree toggle git_status reveal left<CR>', { noremap = true, silent = true })

      -- Focus Neo-tree window
      vim.keymap.set('n', '<leader>nf', ':Neotree focus<CR>', { noremap = true, silent = true })

      -- Reveal current file in tree
      vim.keymap.set('n', '<leader>nr', ':Neotree reveal<CR>', { noremap = true, silent = true })

      -- Refresh
      vim.keymap.set('n', '<leader>R', ':Neotree refresh<CR>', { noremap = true, silent = true })

    end
  },
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
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
}