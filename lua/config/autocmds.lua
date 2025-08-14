-- Treat .razor files as html
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.razor",
    command = "set filetype=html"
})