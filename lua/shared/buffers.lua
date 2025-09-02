local api = vim.api

local M = {}

function M.Get_current_buf()
  return api.nvim_get_current_buf()
end

function M.Get_buffs()
  return api.nvim_list_bufs()
end

function M.Is_unmodified_buf(bufnr)
  bufnr = bufnr or M.Get_current_buf()
  return api.nvim_buf_is_valid(bufnr) and not api.nvim_buf_get_option(bufnr, "modified")
end

function M.Create_empty_temp_buf()
  -- unlisted scratch
  return api.nvim_create_buf(false, true)
end

function M.Set_current_buffer(bufnr)
  bufnr = bufnr or M.Get_current_buf()
  if api.nvim_buf_is_valid(bufnr) then
    api.nvim_set_current_buf(bufnr)
    return true
  end
  return false, "Buffer is not valid"
end

return M