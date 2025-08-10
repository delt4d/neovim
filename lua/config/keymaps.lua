-- Function to toggle/reuse the terminal
local toggle_terminal = function()
    for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
        local buffer_name = vim.api.nvim_buf_get_name(buffer)
        if buffer_name:sub(1, 7) == "term://" then
            -- If already in terminal, hide it
            if vim.bo.buftype == "terminal" then
                vim.api.nvim_command("hide")
                return
            end
            -- Otherwise, switch to existing terminal buffer
            vim.api.nvim_win_set_buf(0, buffer)
            return
        end
    end
    -- No terminal found, create a new one
    vim.api.nvim_command("terminal")
    vim.api.nvim_command("startinsert")
end

-- Keymap to toggle terminal
-- vim.keymap.set({ 'n', 'i' }, '<C-j>', '<ESC>:terminal<CR>i', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<C-j>', function()
    toggle_terminal()
end, { noremap = true, silent = true })

-- Keymap to close terminal
vim.keymap.set('t', '<C-q>', [[<C-\><C-n>:hide<CR>]], { noremap = true, silent = true })
