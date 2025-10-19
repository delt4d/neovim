if vim.g.is_linux then
    vim.cmd("set clipboard+=unnamedplus")

    if vim.g.is_wayland then
        vim.g.clipboard = {
            name = "wl-clipboard",
            copy = {
                ["+"] = "wl-copy",
                ["*"] = "wl-copy",
            },
            paste = {
                ["+"] = "wl-paste",
                ["*"] = "wl-paste",
            },
            cache_enabled = false,
        }
    end
else
    vim.cmd("set clipboard=unnamedplus")
end
