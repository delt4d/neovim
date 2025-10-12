vim.keymap.set({ 'n', 'i', 't' }, '<C-j>', "<ESC>:terminal<CR>",
    { noremap = true, silent = true, desc = "Open terminal" })

vim.keymap.set('t', '<Tab>', '<Tab>',
    { noremap = true, silent = true, desc = "Normal Tab behavior in terminal" })
