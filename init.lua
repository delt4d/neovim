require("config.lazy")

require("config.options")
require("config.keymaps")
require("config.usercmds")
require("config.autocmds")

if vim.g.is_linux  then
   require("config.linux")
end

if vim.g.vscode then
   require("config.vscode")
end
