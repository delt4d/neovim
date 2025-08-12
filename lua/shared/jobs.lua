function Run_background(cmd)
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = function(_, data, _)
      if data then
        print(table.concat(data, "\n"))
      end
    end,
    on_stderr = function(_, data, _)
      if data then
        print("Error: " .. table.concat(data, "\n"))
      end
    end,
    on_exit = function(_, code, _)
      print("Process exited with code " .. code)
    end,
  })
end

function Run_sync(cmd)
  local output = vim.fn.system(cmd)
  print(output)
end
