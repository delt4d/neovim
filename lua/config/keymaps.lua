local terminal = require("shared.terminal")

-- Terminal keymaps
vim.keymap.set({ 'n', 'i', 't' }, '<C-j>', terminal.Toggle_terminal,
  { noremap = true, silent = true, desc = "Toggle terminal (normal/insert/terminal modes)" })

vim.keymap.set({ 'n', 'i', 't' }, '<M-j>', terminal.Create_terminal,
  { noremap = true, silent = true, desc = "Create new terminal" })

vim.keymap.set('t', '<Esc>', terminal.Quit_terminal,
  { noremap = true, silent = true, desc = "Quit terminal without opening Neo-tree" })

vim.keymap.set('t', '<C-n>', terminal.Next_terminal,
  { noremap = true, silent = true, desc = "Go to next terminal" })

vim.keymap.set('t', '<C-p>', terminal.Prev_terminal,
  { noremap = true, silent = true, desc = "Go to previous terminal" })

vim.keymap.set({ 'n', 't' }, '<C-o>', terminal.Term_jump_back,
  { noremap = true, silent = true, desc = "Go to previous buffer" })

vim.keymap.set({ 'n', 't' }, '<C-i>', terminal.Term_jump_forward,
  { noremap = true, silent = true, desc = "Go to next buffer" })

-- Navigation & editing
vim.keymap.set({ "n", "v", "o" }, "<Home>", "^",
  { noremap = true, silent = true, desc = "Jump to first non-whitespace character" })

vim.keymap.set({ "n", "v", "o" }, "<End>", "g_",
  { noremap = true, silent = true, desc = "Jump to last non-whitespace character" })

vim.keymap.set('n', '<Leader>o', 'o<Esc>',
  { noremap = true, silent = true, desc = "Insert blank line below (stay in normal mode)" })

vim.keymap.set('n', '<Leader>O', 'O<Esc>',
  { noremap = true, silent = true, desc = "Insert blank line above (stay in normal mode)" })

vim.keymap.set({ 'n', 'i' }, '<C-s>', '<ESC>:w<CR>',
  { noremap = true, silent = true, desc = "Save file" })

vim.keymap.set("n", "<leader>n", ":bnext<CR>",
  { noremap = true, silent = true, desc = "Go to next opened buffer" })

vim.keymap.set("n", "<leader>p", ":bprevious<CR>",
  { noremap = true, silent = true, desc = "Go to previous opened buffer" })

-- Optional: select all (overrides increment or decrement keymap)
-- vim.keymap.set({ 'n', 'i' }, '<C-a>', '<ESC>ggVG',
--   { noremap = true, silent = true, desc = "Select all text" })
