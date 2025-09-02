-- Autocommands
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
     pattern = "*.cshtml",
     command = "set filetype=cs.html.cshtml.razor",
     desc = "Set filetype for ASP.NET .cshtml files"
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
     pattern = "*.razor",
     command = "set filetype=cs.html.cshtml.razor",
     desc = "Set filetype for ASP.NET .razor files"
})

vim.api.nvim_create_autocmd("VimEnter", {
     callback = function()
          local is_empty = vim.fn.argc() == 0
          local is_dir = vim.fn.isdirectory(vim.fn.getcwd()) == 1

          if is_empty and is_dir then
               require('neo-tree.command').execute({
                    action = "focus",
                    source = "filesystem",
                    position = "current",
                    reveal_force_cwd = true,
               })
          end
     end
})
