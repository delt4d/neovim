return {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = "Git",
    config = function()
      vim.keymap.set("n", "<leader>gs", ":Git<CR>")
    end
}