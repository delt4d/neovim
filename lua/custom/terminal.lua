local terminal = require("shared.terminal")

vim.keymap.set({ 'n', 'i', 't' }, '<C-j>', terminal.ToggleTerminal,
    { noremap = true, silent = true, desc = "Toggle terminal (normal/insert/terminal modes)" })

vim.keymap.set({ 'n', 'i', 't' }, '<M-j>', terminal.CreateTerminal,
    { noremap = true, silent = true, desc = "Create new terminal" })

vim.keymap.set('t', '<Esc>', terminal.QuitTerminal,
    { noremap = true, silent = true, desc = "Quit terminal without opening Neo-tree" })

vim.keymap.set('t', '<C-n>', terminal.NextTerminal,
    { noremap = true, silent = true, desc = "Go to next terminal" })

vim.keymap.set('t', '<C-p>', terminal.PrevTerminal,
    { noremap = true, silent = true, desc = "Go to previous terminal" })

vim.keymap.set({ 'n', 't' }, '<C-o>', terminal.TermJumpBack,
    { noremap = true, silent = true, desc = "Go to previous buffer" })

vim.keymap.set({ 'n', 't' }, '<C-i>', terminal.TermJumpForward,
    { noremap = true, silent = true, desc = "Go to next buffer" })

vim.keymap.set('t', '<Tab>', '<Tab>',
    { noremap = true, silent = true, desc = "Normal Tab behavior in terminal" })
