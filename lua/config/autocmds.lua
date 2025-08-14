vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
     pattern = "*.cshtml",
     command = "set filetype=cs.html.cshtml.razor"
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
     pattern = "*.razor",
     command = "set filetype=cs.html.cshtml.razor"
})