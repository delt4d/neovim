require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.user_commands")

if vim.g.vscode then
   require("config.vscode")
end
