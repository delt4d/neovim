-- User commands
vim.api.nvim_create_user_command("Q", function()
  vim.cmd("qall")
end, { desc = "Quit all windows (safe, stops if unsaved)" })

vim.api.nvim_create_user_command("QQ", function()
  vim.cmd("qall!")
end, { desc = "Force quit all windows (discard unsaved changes)" })

vim.api.nvim_create_user_command("WQ", function()
  vim.cmd("wall | qall")
end, { desc = "Save all buffers and quit" })

vim.api.nvim_create_user_command("Wq", function()
  vim.cmd("wall | qall")
end, { desc = "Save all buffers and quit" })