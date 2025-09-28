return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
    config = function() 
        require("screenkey").setup({
            win_opts = {
                width = 25,
                height = 1
            },
            keys = {
                ["<S-TAB>"] = "⇤",
                ["<BS>"] = "⌫",
            }
        })

        vim.cmd("Screenkey toggle")
    end
}