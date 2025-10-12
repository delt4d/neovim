vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.is_linux = vim.loop.os_uname().sysname == "Linux"
vim.g.is_wayland = os.getenv("WAYLAND_DISPLAY") ~= nil
vim.g.lsp_servers = { "lua_ls" }