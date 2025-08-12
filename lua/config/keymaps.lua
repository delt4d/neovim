require("shared.buffers")
require("shared.terminal")

local toggle_terminal = function()
    local buffers = Get_buffs()
    local bufnr = Get_current_buf()

    if Is_terminal_buf(bufnr) then
        if vim.fn.mode() == "t" then
            Leave_terminal_mode()
            return
        end
        
        vim.api.nvim_command("startinsert")
        return
    end

    if #buffers == 0 or Is_unmodified_buf(bufnr) then
        -- No buffer exists at all, create a new empty buffer
        Create_empty_temp_buf()
    end

    for _, buffer in ipairs(buffers) do
        if Is_terminal_buf(buffer) then
            Set_current_buffer(buffer)
            return;
        end
    end

    Create_terminal()
    vim.api.nvim_command("startinsert")
end

-- Use <C-j> for normal, insert, and terminal modes to toggle terminal open/close
vim.keymap.set({ 'n', 'i', 't' }, '<C-j>', function()
    toggle_terminal()
end, { noremap = true, silent = true })

-- Go to first non-whitespace character in the line
vim.keymap.set({ "n", "v", "o" }, "<Home>", "^", { noremap = true, silent = true })

-- Go to last non-whitespace character in the line
vim.keymap.set({ "n", "v", "o" }, "<End>", "g_", { noremap = true, silent = true })

-- Create blank line above and below
vim.keymap.set('n', '<Leader>o', 'o<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>O', 'O<Esc>', { noremap = true, silent = true })

-- Keymap to save file
vim.keymap.set({ 'n', 'i' }, 'C-s', '<ESC>:w<CR>', { noremap = true, silent = true })