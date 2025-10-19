local cmd, fn, o = vim.cmd, vim.fn, vim.o
local themes = fn.getcompletion("", "color")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local M = {}

function M.PickTheme(onThemeSelected)
    onThemeSelected = onThemeSelected or function() end

    -- Save current theme to restore if user cancels
    local prev_theme = vim.g.prev_theme_opt or ""
    local prev_bg = o.background

    pickers.new({}, {
        finder = finders.new_table(themes),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            local function set_selected()
                local selection = action_state.get_selected_entry()
                local theme = selection[1]
                onThemeSelected(theme)
                actions.close(prompt_bufnr)
            end

            actions.select_default:replace(set_selected)

            map("i", "<ESC>", function()
                -- Restore previous theme if cancelled
                pcall(cmd.colorscheme, prev_theme)
                o.background = prev_bg
                actions.close(prompt_bufnr)
            end)

            map("n", "<ESC>", function()
                pcall(cmd.colorscheme, prev_theme)
                o.background = prev_bg
                actions.close(prompt_bufnr)
            end)

            map("i", "<C-j>", function()
                actions.move_selection_next(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then pcall(cmd.colorscheme, selection[1]) end
            end)

            map("i", "<C-k>", function()
                actions.move_selection_previous(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then pcall(cmd.colorscheme, selection[1]) end
            end)

            return true
        end,
    }):find()
end

return M
