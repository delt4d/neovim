require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.usercmds")
require("config.autocmds")

if vim.g.vscode then
   require("config.vscode")
end
