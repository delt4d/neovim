if vim.g.vscode then
    local vscode = require("vscode")

    vim.notify = vscode.notify
    vim.g.clipboard = vim.g.vscode_clipboard

    vim.keymap.set({ "n", "x" }, "F2", function()
        vscode.with_insert(function()
            vscode.action("editor.action.refactor")
        end)
    end)

    vim.keymap.set("n", "C-n", function()
        vscode.call("explorer.openToSide")
    end)

    vim.keymap.set({ 'n', 'i' }, '<C-j>', function()
        vim.fn.VSCodeNotify('workbench.action.terminal.toggleTerminal')
    end)
end
