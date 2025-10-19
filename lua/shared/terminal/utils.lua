local buffers = require("shared.buffers")
local explorer = require("shared.explorer")
local api, cmd, fn = vim.api, vim.cmd, vim.fn
local shell = vim.o.shell

local M = {}
local terminal_count = 0

function M.IsTerminaBuf(bufnr)
    bufnr = bufnr or buffers.GetCurrBuf()
    return buffers.IsTerminalBuf(bufnr)
end

function M.GetTerminalBufs()
    local list, terminals = buffers.GetBufs(), {}
    for _, buf in ipairs(list) do
        if M.IsTerminaBuf(buf) then
            table.insert(terminals, buf)
        end
    end
    return terminals
end

function M.CreateTerminal(cmdline)
    cmdline = cmdline or shell
    explorer.CloseExplorer()

    local term_buf = buffers.CreateBuf(false, true)
    buffers.SetCurrBuf(term_buf)
    fn.jobstart(cmdline, { term = true })
    api.nvim_buf_set_name(term_buf, "Terminal " .. terminal_count + 1)
    api.nvim_command("startinsert")

    terminal_count = terminal_count + 1

    return term_buf
end

function M.GotoTerminal(index)
    local terms = M.GetTerminalBufs()

    if #terms == 0 then
        return 1, M.CreateTerminal()
    end

    if index > #terms then
        index = 1
    elseif index < 1 then
        index = #terms
    end

    local buf = terms[index]
    buffers.SetCurrBuf(buf)
    api.nvim_command("startinsert")

    return index, buf
end

function M.LeaveTerminalMode()
    api.nvim_feedkeys(api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
end

function M.ToggleTerminal()
    if M.IsTerminaBuf() then
        if fn.mode() == "t" then
            M.LeaveTerminalMode()
            explorer.OpenExplorerInCurrentBuf()
            return
        end

        explorer.CloseExplorer()
        api.nvim_command("startinsert")
        return
    end

    if buffers.IsExplorerBuf() then
        cmd("silent! hide")
    end

    local terms = M.GetTerminalBufs()
    if vim.g.terminal_index > #terms then
        vim.g.terminal_index = #terms
    end

    if #terms > 0 and terms[vim.g.terminal_index] then
        buffers.SetCurrBuf(terms[vim.g.terminal_index])
        api.nvim_command("startinsert")
    else
        vim.g.terminal_index, _ = M.GotoTerminal(vim.g.terminal_index)
    end
end

function M.QuitTerminal()
    if fn.mode() == "t" then
        M.LeaveTerminalMode()
        return
    end

    if buffers.IsTerminalBuf() then
        cmd("silent! hide")
    end
end

function M.NextTerminal()
    vim.g.terminal_index, _ = M.GotoTerminal(vim.g.terminal_index + 1)
end

function M.PrevTerminal()
    vim.g.terminal_index, _ = M.GotoTerminal(vim.g.terminal_index - 1)
end

function M.TermJumpBack()
    if fn.mode() == "t" then
        M.LeaveTerminalMode()
    end
    api.nvim_feedkeys(api.nvim_replace_termcodes("<C-o>", true, false, true), "n", true)
end

function M.TermJumpForward()
    if fn.mode() == "t" then
        M.LeaveTerminalMode()
    end
    api.nvim_feedkeys(api.nvim_replace_termcodes("<C-i>", true, false, true), "n", true)
end

return M
