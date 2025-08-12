local api = vim.api

-- Get current buffer number
function Get_current_buf()
  return api.nvim_get_current_buf()
end

-- Get list of buffers
function Get_buffs()
    return api.nvim_list_bufs()
end

-- Check if given buffer is unmodified (no changes)
function Is_unmodified_buf(bufnr)
  bufnr = bufnr or Get_current_buf()
  return not api.nvim_buf_get_option(bufnr, 'modified')
end

-- Create an empty temporary buffer
function Create_empty_temp_buf()
  -- unlisted, scratch buffer
  local buf = api.nvim_create_buf(false, true)
  return buf
end

-- Replace buffer
function Set_current_buffer(bufnr)
  bufnr = bufnr or Get_current_buf()
  -- Check if buffer exists before switching
  if api.nvim_buf_is_valid(bufnr) then
    api.nvim_set_current_buf(bufnr)
    return true
  else
    return false, "Buffer is not valid"
  end
end