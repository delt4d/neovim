local api = vim.api
local utils = require("shared.theme.utils")
local picker = require("shared.theme.picker")
local M = {}

function M.RefreshCommands()
    api.nvim_create_user_command("Dark", function()
        if not utils.UseDarkTheme() then
            picker.PickTheme(function(selectedTheme)
                utils.SetDarkTheme(selectedTheme)
                utils.UseDarkTheme()
                utils.SaveConfig()
                M.RefreshCommands()
            end)
        else
            utils.SaveConfig()
            M.RefreshCommands()
        end
    end, { desc = "Switch to the configured dark theme (" .. (vim.g.dark_theme or "not set") .. ")" })

    api.nvim_create_user_command("Light", function()
        if not utils.UseLightTheme() then
            picker.PickTheme(function(selectedTheme)
                utils.SetLightTheme(selectedTheme)
                utils.UseLightTheme()
                utils.SaveConfig()
                M.RefreshCommands()
            end)
        else
            utils.SaveConfig()
            M.RefreshCommands()
        end
    end, { desc = "Switch to the configured light theme (" .. (vim.g.light_theme or "not set") .. ")" })

    api.nvim_create_user_command("SetDarkTheme", function(opts)
        picker.PickTheme(function(selectedTheme)
            utils.SetDarkTheme(selectedTheme)
            utils.UseDarkTheme()
            utils.SaveConfig()
            M.RefreshCommands()
        end)
    end, {
        nargs = "?",
        complete = "color",
        desc = "Set which theme should be used as dark (current: " .. (vim.g.dark_theme or "not set") .. ")"
    })

    api.nvim_create_user_command("SetLightTheme", function(opts)
        picker.PickTheme(function(selectedTheme)
            utils.SetLightTheme(selectedTheme)
            utils.UseLightTheme()
            utils.SaveConfig()
            M.RefreshCommands()
        end)
    end, {
        nargs = "?",
        complete = "color",
        desc = "Set which theme should be used as light (current: " .. (vim.g.light_theme or "not set") .. ")"
    })

    api.nvim_create_user_command("ToggleTheme", function()
        utils.ToggleTheme()
        utils.SaveConfig()
        M.RefreshCommands()
    end, {
        desc = "Toggle between dark (" ..
            (vim.g.dark_theme or "not set") .. ") and light (" .. (vim.g.light_theme or "not set") .. ") themes"
    })
end

function M.Init()
    utils.LoadConfig()
    utils.ApplyLastTheme()
    M.RefreshCommands()
end

return M
