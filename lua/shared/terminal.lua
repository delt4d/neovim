require("shared.buffers")
require("shared.jobs")

local api = vim.api

-- Check if given buffer is a terminal buffer
function Is_terminal_buf(bufnr)
    bufnr = bufnr or Get_current_buf()
    local buf_type = api.nvim_buf_get_option(bufnr, 'buftype')
    return buf_type == 'terminal'
end

-- Open a terminal in a new split window
function Open_terminal(cmd)
    cmd = cmd or nil
    vim.cmd('split')
    local term_buf = api.nvim_create_buf(false, true) -- no listed, scratch buffer
    api.nvim_set_current_buf(term_buf)
    vim.fn.termopen(cmd or vim.o.shell)
    vim.cmd('startinsert')
    return term_buf
end

-- Create a terminal buffer without opening a window
function Create_terminal(cmd)
    cmd = cmd or vim.o.shell
    vim.cmd("silent! Neotree close")
    local term_buf = api.nvim_create_buf(false, true)
    Set_current_buffer(term_buf)
    vim.fn.termopen(cmd)
    return term_buf
end

function Leave_terminal_mode()
  -- Send the escape sequence to go from Terminal mode to Normal mode
  api.nvim_feedkeys(api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
end