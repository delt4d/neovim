local cmd = vim.cmd
local M = {}

function M.CloseExplorer()
    cmd("silent! Neotree close")
end

function M.OpenExplorerInCurrentBuf()
    cmd("silent! Neotree current")
end

return M
