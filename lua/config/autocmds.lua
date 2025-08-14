-- Treat .razor files as csharp code
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.razor",
    command = "set filetype=cs"
})