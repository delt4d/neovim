local fn, cmd, log, o = vim.fn, vim.cmd, vim.log, vim.o
local config_file = fn.stdpath("data") .. "/theme_config.json"
local M = {}

local function ApplyTheme(theme, background_opt)
    if not theme or theme == "" then
        vim.notify("Theme is not defined. Use :SetDarkTheme or :SetLightTheme first.", log.levels.ERROR)
        return false
    end

    local ok, err = pcall(cmd.colorscheme, theme)

    if not ok then
        vim.notify("Failed to load theme '" .. theme .. "': " .. err, log.levels.ERROR)
        return false
    end

    o.background = background_opt
    vim.g.last_theme_opt = background_opt
    return true
end

function M.SaveConfig()
    local data = {
        dark = vim.g.dark_theme,
        light = vim.g.light_theme,
        last = vim.g.last_theme_opt
    }
    local f = io.open(config_file, "w")

    if f then
        f:write(fn.json_encode(data))
        f:close()
        return true
    end

    return false
end

function M.LoadConfig()
    local f = io.open(config_file, "r")

    if not f then
        print("Not fonud")
        return false
    end

    local ok, data = pcall(fn.json_decode, f:read("*a"))
    f:close()
    if ok and data then
        vim.g.dark_theme = data.dark or nil
        vim.g.light_theme = data.light or nil
        vim.g.last_theme_opt = data.last or nil
        return true
    end

    return false
end

function M.ApplyLastTheme()
    if not vim.g.last_theme_opt then
        print("no last theme?")
        return
    end

    if vim.g.last_theme_opt == "dark" then
        M.UseDarkTheme()
    else
        M.UseLightTheme()
    end
end

function M.UseDarkTheme()
    return ApplyTheme(vim.g.dark_theme, "dark")
end

function M.UseLightTheme()
    return ApplyTheme(vim.g.light_theme, "light")
end

function M.SetDarkTheme(theme)
    if theme and theme ~= "" then
        vim.g.dark_theme = theme
        return true
    end

    return false
end

function M.SetLightTheme(theme)
    if theme and theme ~= "" then
        vim.g.light_theme = theme
        return true
    end

    return false
end

function M.ToggleTheme()
    if o.background == "light" then
        M.UseDarkTheme()
    else
        M.UseLightTheme()
    end
end

return M
