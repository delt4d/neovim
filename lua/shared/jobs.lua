local fn = vim.fn

local M = {}

function M.Run_background(cmd, opts)
  opts = opts or {}
  fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = opts.on_stdout or function(_, data, _)
      if data and #data > 0 then
        vim.notify(table.concat(data, "\n"), vim.log.levels.INFO)
      end
    end,
    on_stderr = opts.on_stderr or function(_, data, _)
      if data and #data > 0 then
        vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR)
      end
    end,
    on_exit = opts.on_exit or function(_, code, _)
      vim.notify("Process exited with code " .. code, vim.log.levels.INFO)
    end,
  })
end

function M.Run_sync(cmd)
  local output = fn.system(cmd)
  return output, vim.v.shell_error
end

return M