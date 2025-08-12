require("shared.buffers")
require("shared.jobs")

function Get_terminal_buffs()
    local buffs = Get_buffs()
    local terminals = {}
    for _, buf in ipairs(buffs) do
        if Is_terminal_buf(buf) then
            table.insert(terminals, buf)
        end
    end
    return terminals
end

function Is_terminal_buf(bufnr)
    bufnr = bufnr or Get_current_buf()
    local buf_type = vim.api.nvim_buf_get_option(bufnr, 'buftype')
    return buf_type == 'terminal'
end

function Create_terminal(cmd)
    cmd = cmd or vim.o.shell
    vim.cmd("silent! Neotree close")
    local term_buf = vim.api.nvim_create_buf(false, true)
    Set_current_buffer(term_buf)
    vim.fn.termopen(cmd)
    vim.api.nvim_command("startinsert")
    return term_buf
end

function Goto_terminal(index)
    local terminals = Get_terminal_buffs()

    if #terminals == 0 then
        Create_terminal()
        return 1
    end

    if index > #terminals then
        index = 0
    end

    local buf = terminals[((index - 1) % #terminals) + 1] -- wrap around
    Set_current_buffer(buf)
    vim.api.nvim_command("startinsert")

    return index
end

function Leave_terminal_mode()
  -- Send the escape sequence to go from Terminal mode to Normal mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
end

local terminal_index = 1

function Toggle_terminal()
    if Is_terminal_buf() then -- check if current buffer is a terminal
        if vim.fn.mode() == "t" then
            Leave_terminal_mode()
            vim.cmd("silent! Neotree")
            return
        end

        vim.cmd("silent! Neotree close")
        vim.api.nvim_command("startinsert")
        return
    end

    -- If current buffer is neotree - hide it
    if vim.bo[Get_current_buf()].filetype == 'neo-tree' then
        vim.cmd('hide')
    end

    local terminals = Get_terminal_buffs()

    if terminal_index > #terminals then
        terminal_index = #terminals
    end

    -- Try to find and reopen another terminal
    for index, buf in ipairs(terminals) do
        if index == terminal_index then
            Set_current_buffer(buf)
            vim.api.nvim_command("startinsert")
            return;
        end
    end

    terminal_index = Goto_terminal(terminal_index)
end

function Next_terminal()
    terminal_index = Goto_terminal(terminal_index + 1)
end

function Prev_terminal()
    terminal_index = Goto_terminal(terminal_index - 1)
end