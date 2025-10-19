local api, bo = vim.api, vim.bo
local M = {}

function M.GetCurrBuf()
    return api.nvim_get_current_buf()
end

function M.CreateBuf(shouldBeListedInBufferList, isTemporary)
    return api.nvim_create_buf(shouldBeListedInBufferList, isTemporary)
end

function M.SetCurrBuf(bufnr)
    bufnr = bufnr or M.GetCurrBuf()
    if api.nvim_buf_is_valid(bufnr) then
        api.nvim_set_current_buf(bufnr)
        return true
    end
    return false, "Buffer is not valid"
end

function M.GetBufs()
    return api.nvim_list_bufs()
end

function M.IsExplorerBuf(bufnr)
    bufnr = bufnr or M.GetCurrBuf()
    if bo[bufnr].filetype == "neo-tree" then
        return true
    end
    return false
end

function M.IsTerminalBuf(bufnr)
    return api.nvim_buf_is_valid(bufnr) and
        api.nvim_buf_get_option(bufnr, "buftype") == "terminal"
end

return M
