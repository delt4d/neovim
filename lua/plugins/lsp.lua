return {
    -- Mason: manages LSP servers
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✅",
                        package_pending = "⏳",
                        package_uninstalled = "❌"
                    }
                },
            })
        end
    },
    -- Mason-LSPConfig: bridge between Mason and LSPConfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")

            -- Capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

            if ok then
                capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
            end

            mason_lspconfig.setup()

            print(vim.lsp.handlers["luals"])
        end,
    }
}
