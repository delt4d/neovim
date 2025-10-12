vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, noremap = true, silent = true }

        -- Definitions
        vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, opts)      -- Show hover info
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) -- Go to definition

        -- Diagnostics
        vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts) -- Show line diagnostics
        vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, opts)  -- Show all diagnostics
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)          -- Next diagnostic
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)          -- Previous diagnostic

        -- Additional LSP actions
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)     -- Show references
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts) -- Go to implementation
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)         -- Rename symbol
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)    -- Code actions
        vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, opts)          -- Format document
    end,
})
