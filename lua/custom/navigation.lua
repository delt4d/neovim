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
