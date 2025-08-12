require("shared.buffers")
require("shared.terminal")

-- Use <C-j> for normal, insert, and terminal modes to toggle terminal open/close
vim.keymap.set({ 'n', 'i', 't' }, '<C-j>', function()
    Toggle_terminal()
end, { noremap = true, silent = true })

-- Go to first non-whitespace character in the line
vim.keymap.set({ "n", "v", "o" }, "<Home>", "^", { noremap = true, silent = true })

-- Go to last non-whitespace character in the line
vim.keymap.set({ "n", "v", "o" }, "<End>", "g_", { noremap = true, silent = true })

-- Create blank line above and below
vim.keymap.set('n', '<Leader>o', 'o<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>O', 'O<Esc>', { noremap = true, silent = true })

-- Keymap to save file
vim.keymap.set({ 'n', 'i' }, 'C-s', '<ESC>:w<CR>', { noremap = true, silent = true })