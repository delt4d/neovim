vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.is_linux = vim.loop.os_uname().sysname == "Linux"
vim.g.is_wayland = os.getenv("WAYLAND_DISPLAY") ~= nil
vim.g.lsp_servers = { "lua_ls", "jsonls", "bashls", "lemminx" }
vim.g.terminal_index = 1
vim.g.dark_theme = nil
vim.g.light_theme = nil
vim.g.last_theme_opt = nil -- 'dark' or 'light'
vim.g.prev_theme_opt = nil
