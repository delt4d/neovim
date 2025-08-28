-- Autocommands
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
     pattern = "*.cshtml",
     command = "set filetype=cs.html.cshtml.razor",
     desc = "Set filetype for ASP.NET .cshtml files"
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
     pattern = "*.razor",
     command = "set filetype=cs.html.cshtml.razor",
     desc = "Set filetype for ASP.NET .razor files"
})