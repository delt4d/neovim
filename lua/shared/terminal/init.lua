local utils = require("shared.terminal.utils")
local M = {}
M.CreateTerminal = utils.CreateTerminal
M.LeaveTerminalModel = utils.LeaveTerminalMode
M.ToggleTerminal = utils.ToggleTerminal
M.QuitTerminal = utils.QuitTerminal
M.NextTerminal = utils.NextTerminal
M.PrevTerminal = utils.PrevTerminal
M.TermJumpBack = utils.TermJumpBack
M.TermJumpForward = utils.TermJumpForward
return M
