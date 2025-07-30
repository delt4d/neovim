return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua", 
        "javascript", 
        "c", 
        "vim", 
        "vimdoc", 
        "query", 
        "markdown", 
        "markdown_inline", 
        "bash", 
        "c_sharp" 
      },
      highlight = { enable=true },
      indent = { enable=true },
    })

  end
}

