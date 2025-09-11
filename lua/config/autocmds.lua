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

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, noremap = true, silent = true }

    -- Definitions
    vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)             -- Show hover info
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)       -- Go to definition

    -- Diagnostics
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)     -- Show line diagnostics
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, opts)      -- Show all diagnostics
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)             -- Next diagnostic
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)             -- Previous diagnostic

    -- Additional LSP actions
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)               -- Show references
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)           -- Go to implementation
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)           -- Rename symbol
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)      -- Code actions
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)            -- Format document
  end,
})