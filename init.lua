require("config.options")
require("config.lazy")
require("config.keymaps")

if vim.g.vscode then
   require("config.vscode")
end
