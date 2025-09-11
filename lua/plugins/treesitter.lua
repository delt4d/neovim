return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "javascript",
        "c",
        "c_sharp",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "bash",
        "dockerfile",
        "json",
        "sql",
        "yaml",
        "python",
        "java"
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
