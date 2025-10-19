if vim.g.vscode then
    local vscode = require("vscode")

    vim.notify = vscode.notify
    vim.g.clipboard = vim.g.vscode_clipboard

    vim.keymap.set({ 'n', 'i' }, '<C-s>', function()
        vscode.action('workbench.action.files.save')
        if vim.fn.mode() == 'i' then
            vim.cmd('stopinsert')
        end
    end, { desc = "Save file" })

    vim.keymap.set("n", "<leader>n", function()
        vscode.action('workbench.action.nextEditor')
    end, { desc = "Go to next editor" })

    vim.keymap.set("n", "<leader>p", function()
        vscode.action('workbench.action.previousEditor')
    end, { desc = "Go to previous editor" })

    -- === LSP ===
    vim.keymap.set("n", "<leader>gh", function()
        vscode.action('editor.action.showHover')
    end, { desc = "Show hover info" })

    vim.keymap.set("n", "<leader>gd", function()
        vscode.action('editor.action.revealDefinition')
    end, { desc = "Go to definition" })

    vim.keymap.set("n", "<leader>gr", function()
        vscode.action('editor.action.goToReferences')
    end, { desc = "Show references" })

    vim.keymap.set("n", "<leader>gi", function()
        vscode.action('editor.action.goToImplementation')
    end, { desc = "Go to implementation" })

    vim.keymap.set("n", "<leader>rn", function()
        vscode.action('editor.action.rename')
    end, { desc = "Rename symbol" })

    vim.keymap.set("n", "<leader>ca", function()
        vscode.action('editor.action.quickFix')
    end, { desc = "Code actions" })

    vim.keymap.set("n", "<leader>=", function()
        vscode.action('editor.action.formatDocument')
    end, { desc = "Format document" })

    -- Diagnostics
    vim.keymap.set("n", "<leader>do", function()
        vscode.action('editor.action.showHover')
    end, { desc = "Show line diagnostics" })

    vim.keymap.set("n", "<leader>dq", function()
        vscode.action('workbench.actions.view.problems')
    end, { desc = "Show all diagnostics" })

    vim.keymap.set("n", "]d", function()
        vscode.action('editor.action.marker.next')
    end, { desc = "Next diagnostic" })

    vim.keymap.set("n", "[d", function()
        vscode.action('editor.action.marker.prev')
    end, { desc = "Previous diagnostic" })

    -- === Telescope equivalents ===
    vim.keymap.set('n', '<leader>ff', function()
        vscode.action('workbench.action.quickOpen')
    end, { desc = 'Find files' })

    vim.keymap.set('n', '<leader>fg', function()
        vscode.action('workbench.action.findInFiles')
    end, { desc = 'Live grep' })

    vim.keymap.set('n', '<leader>fb', function()
        vscode.action('workbench.action.showAllEditors')
    end, { desc = 'Show buffers' })

    vim.keymap.set('n', '<leader>fh', function()
        vscode.action('workbench.action.showCommands')
    end, { desc = 'Command palette' })

    -- === Neo-tree equivalent ===
    vim.keymap.set('n', '<C-n>', function()
        vscode.action('workbench.view.explorer')
    end, { desc = 'Toggle file explorer' })

    -- === Terminal ===
    vim.keymap.set({ 'n', 'i', 't' }, '<C-j>', function()
        vscode.action('workbench.action.terminal.toggleTerminal')
    end, { desc = "Toggle terminal" })

    -- === Additional useful bindings ===
    vim.keymap.set({ "n", "x" }, "F2", function()
        vscode.with_insert(function()
            vscode.action("editor.action.refactor")
        end)
    end, { desc = "Refactor" })

    -- Comment toggle
    vim.keymap.set({ "n", "x" }, "<C-/>", function()
        vscode.action('editor.action.commentLine')
    end, { desc = "Toggle comment" })

    -- Split navigation
    vim.keymap.set("n", "<C-h>", function()
        vscode.action('workbench.action.navigateLeft')
    end, { desc = "Navigate left" })

    vim.keymap.set("n", "<C-l>", function()
        vscode.action('workbench.action.navigateRight')
    end, { desc = "Navigate right" })

    -- Close editor (similar to quit commands)
    vim.keymap.set("n", "<leader>q", function()
        vscode.action('workbench.action.closeActiveEditor')
    end, { desc = "Close editor" })

    -- Peek definition
    vim.keymap.set("n", "gp", function()
        vscode.action('editor.action.peekDefinition')
    end, { desc = "Peek definition" })

    -- Git commands
    vim.keymap.set("n", "<leader>gg", function()
        vscode.action('workbench.view.scm')
    end)
    vim.keymap.set("n", "<leader>gd", function()
        vscode.action('git.openChange')
    end)
end
