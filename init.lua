require("config.options")

if vim.g.is_linux  then
   require("config.linux")
end

require("config.lazy")

require("config.keymaps")
require("config.usercmds")
require("config.autocmds")

if vim.g.vscode then
   require("config.vscode")
end