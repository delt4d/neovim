if vim.g.vscode then
    vim.keymap.set({ 'n', 'i' }, '<C-j>', '<ESC>:terminal<CR>i', { noremap = true, silent = true })
end