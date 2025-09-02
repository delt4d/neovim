local buffers = require("shared.buffers")

local api, fn, cmd = vim.api, vim.fn, vim.cmd
local M = {}

local terminal_index = 1

local function Is_terminal_buf(bufnr)
  bufnr = bufnr or buffers.Get_current_buf()
  return api.nvim_buf_is_valid(bufnr)
    and api.nvim_buf_get_option(bufnr, "buftype") == "terminal"
end

function M.Get_terminal_buffs()
  local list, terminals = buffers.Get_buffs(), {}
  for _, buf in ipairs(list) do
    if Is_terminal_buf(buf) then
      table.insert(terminals, buf)
    end
  end
  return terminals
end

function M.Create_terminal(cmdline)
  cmdline = cmdline or vim.o.shell
  cmd("silent! Neotree close")
  local term_buf = api.nvim_create_buf(false, true)
  buffers.Set_current_buffer(term_buf)
  fn.termopen(cmdline)
  api.nvim_command("startinsert")
  return term_buf
end

local function Goto_terminal(index)
  local terms = M.Get_terminal_buffs()

  if #terms == 0 then
    return 1, M.Create_terminal()
  end

  if index > #terms then
    index = 1
  elseif index < 1 then
    index = #terms
  end

  local buf = terms[index]
  buffers.Set_current_buffer(buf)
  api.nvim_command("startinsert")
  return index, buf
end

function M.Leave_terminal_mode()
  api.nvim_feedkeys(api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
end

function M.Toggle_terminal()
  if Is_terminal_buf() then
    if fn.mode() == "t" then
      M.Leave_terminal_mode()
      cmd("silent! Neotree")
      return
    end
    cmd("silent! Neotree close")
    api.nvim_command("startinsert")
    return
  end

  if vim.bo[buffers.Get_current_buf()].filetype == "neo-tree" then
    cmd("hide")
  end

  local terms = M.Get_terminal_buffs()
  if terminal_index > #terms then
    terminal_index = #terms
  end

  if #terms > 0 and terms[terminal_index] then
    buffers.Set_current_buffer(terms[terminal_index])
    api.nvim_command("startinsert")
  else
    terminal_index, _ = Goto_terminal(terminal_index)
  end
end

function M.Quit_terminal()
  if fn.mode() == "t" then
    M.Leave_terminal_mode()
    return
  end
  if vim.bo[buffers.Get_current_buf()].buftype == "terminal" then
    -- Already in terminal buffer but normal mode
    vim.cmd("hide")
  end
end

function M.Next_terminal()
  terminal_index, _ = Goto_terminal(terminal_index + 1)
end

function M.Prev_terminal()
  terminal_index, _ = Goto_terminal(terminal_index - 1)
end

return M