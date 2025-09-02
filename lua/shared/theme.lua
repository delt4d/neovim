local api, fn, cmd, o = vim.api, vim.fn, vim.cmd, vim.o
local M = {}

local config_file = fn.stdpath("data") .. "/theme_config.json"
local dark_theme = nil
local light_theme = nil
local last_opt = nil  -- "dark" or "light"

-- helpers to save/load json
local function save_config()
    local data = { dark = dark_theme, light = light_theme, last = last_opt }
    local f = io.open(config_file, "w")
    if f then
        f:write(vim.fn.json_encode(data))
        f:close()
    end
end

local function load_config()
    local f = io.open(config_file, "r")
    if not f then
        return
    end
    local ok, data = pcall(vim.fn.json_decode, f:read("*a"))
    f:close()
    if ok and data then
        dark_theme = data.dark or nil
        light_theme = data.light or nil
        last_opt = data.last or nil

        if last_opt == "dark" then
            M.UseDark()
        elseif last_opt == "light" then
            M.UseLight()
        end
    end
end

local function apply(theme, bg_opt)
    if not theme or theme == "" then
        vim.notify("Theme is not defined. Use :SetDarkTheme or :SetLightTheme first.", vim.log.levels.ERROR)
        return false
    end
    local ok, err = pcall(cmd.colorscheme, theme)
    if not ok then
        vim.notify("Failed to load theme '" .. theme .. "': " .. err, vim.log.levels.ERROR)
        return false
    end
    o.background = bg_opt
    last_opt = bg_opt
    save_config()
    vim.notify("Switched to theme " .. theme, vim.log.levels.INFO)
    return true
end

function M.UseDark()
    apply(dark_theme, "dark")
end

function M.UseLight()
    apply(light_theme, "light")
end

function M.SetDark(theme)
    dark_theme = theme
    save_config()
    M.RefreshCommands()
    vim.notify("Dark theme set to " .. theme, vim.log.levels.INFO)
end

function M.SetLight(theme)
    light_theme = theme
    save_config()
    M.RefreshCommands()
    vim.notify("Light theme set to " .. theme, vim.log.levels.INFO)
end

function M.Toggle()
    if o.background == "light" then
        M.UseDark()
    else
        M.UseLight()
    end
end

-- recreate commands with updated descriptions
function M.RefreshCommands()
    api.nvim_create_user_command("Dark", function()
        M.UseDark()
    end, { desc = "Switch to the configured dark theme (" .. (dark_theme or "not set") .. ")" })

    api.nvim_create_user_command("Light", function()
        M.UseLight()
    end, { desc = "Switch to the configured light theme (" .. (light_theme or "not set") .. ")" })

    api.nvim_create_user_command("SetDarkTheme", function(opts)
        M.SetDark(opts.args)
    end, {
        nargs = 1,
        complete = "color",
        desc = "Set which theme should be used as dark (current: " .. (dark_theme or "not set") .. ")" 
    })

    api.nvim_create_user_command("SetLightTheme", function(opts)
        M.SetLight(opts.args)
    end, {
        nargs = 1,
        complete = "color",
        desc = "Set which theme should be used as light (current: " .. (light_theme or "not set") .. ")" 
    })

    api.nvim_create_user_command("ToggleTheme", function()
        M.Toggle()
    end, {
        desc = "Toggle between dark (" .. (dark_theme or "not set") .. ") and light (" .. (light_theme or "not set") .. ") themes" 
    })
end

load_config()
M.RefreshCommands()

return M
