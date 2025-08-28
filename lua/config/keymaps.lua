require("shared.buffers")
require("shared.terminal")

-- Terminal keymaps
vim.keymap.set({ 'n', 'i', 't' }, '<C-j>', Toggle_terminal,
  { noremap = true, silent = true, desc = "Toggle terminal (normal/insert/terminal modes)" })

vim.keymap.set({ 'n', 'i', 't' }, '<M-j>', Create_terminal,
  { noremap = true, silent = true, desc = "Create new terminal" })

vim.keymap.set('t', '<C-n>', Next_terminal,
  { noremap = true, silent = true, desc = "Go to next terminal" })

vim.keymap.set('t', '<C-p>', Prev_terminal,
  { noremap = true, silent = true, desc = "Go to previous terminal" })

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

-- Optional: overrides increment command <C-a> to select all
-- vim.keymap.set({ 'n', 'i' }, '<C-a>', '<ESC>ggVG',
--   { noremap = true, silent = true, desc = "Select all text" })