vim.api.nvim_create_user_command("Q", function()
  vim.cmd("qall")
end, {})

vim.api.nvim_create_user_command("QQ", function()
  vim.cmd("qall!")
end, {})

vim.api.nvim_create_user_command("WQ", function()
  vim.cmd("wall | qall")
end, {})

vim.api.nvim_create_user_command("Wq", function()
  vim.cmd("wall | qall")
end, {})
