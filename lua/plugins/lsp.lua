return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "bashls",
            "clangd",
            "html",
            "lua_ls",
            "ts_ls",
        },

        diagnostic_config = {
            float = {
                focusable = false,
                style     = "minimal",
                border    = "rounded",
                source    = "always",
                header    = "",
                prefix    = "",
            },
        },
    },

    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig"
    },
}
