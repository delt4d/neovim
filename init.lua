vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "

require("config.lazy")

-- catppuccin
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
