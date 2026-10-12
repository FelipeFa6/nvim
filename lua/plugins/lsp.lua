-- ~/.config/nvim/lua/plugins/lsp.lua

return {
        {
                "mason-org/mason.nvim",
                lazy = false,
                opts = {},
        },

        {
                "mason-org/mason-lspconfig.nvim",
                lazy = false,
                dependencies = {
                        "mason-org/mason.nvim",
                        "neovim/nvim-lspconfig",
                },
                opts = {
                        ensure_installed = {},
                        automatic_enable = {
                                exclude = { "ts_ls" },
                        },
                },
        },

        {
                "stevearc/conform.nvim",
                event = { "BufWritePre" },
                cmd = { "ConformInfo" },
                opts = {
                        formatters_by_ft = {
                                tex = { "tex-fmt" },
                                plaintex = { "tex-fmt" },
                                bib = { "tex-fmt" },
                        },
                        -- format_on_save = {
                        --         timeout_ms = 500,
                        --         lsp_format = "fallback",
                        -- },
                },
        },

        {
                "neovim/nvim-lspconfig",
                lazy = false,
                config = function()
                        local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
                        if ok then
                                vim.lsp.config("*", {
                                        capabilities = cmp_lsp.default_capabilities(),
                                })
                        end

                        vim.lsp.config("gopls", {})
                        vim.lsp.enable("gopls")

                        vim.lsp.config("tsc", {
                                cmd = { "tsc", "--lsp", "--stdio" },
                                filetypes = {
                                        "javascript",
                                        "javascriptreact",
                                        "typescript",
                                        "typescriptreact",
                                },
                                root_markers = {
                                        "tsconfig.json",
                                        "jsconfig.json",
                                        "package.json",
                                        ".git",
                                },
                        })
                        vim.lsp.enable("tsc")

                        vim.lsp.config("ltex_plus", {
                                settings = {
                                        ltex = {
                                                language = "es",
                                                latex = {
                                                        commands = {
                                                                { name = "resumeItem", arguments = { 1 } },
                                                                { name = "resumeItemListStart", arguments = {} },
                                                                { name = "resumeItemListEnd", arguments = {} },
                                                        },
                                                },
                                        },
                                },
                        })
                        vim.lsp.enable("ltex_plus")

                        vim.diagnostic.config({
                                virtual_text = true,
                                severity_sort = true,
                                float = { border = "rounded" },
                        })

                        vim.api.nvim_create_autocmd("LspAttach", {
                                desc = "Keymaps de LSP por buffer",
                                callback = function(args)
                                        local function map(lhs, rhs, desc)
                                                vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
                                        end

                                        map("K", vim.lsp.buf.hover, "Hover")
                                        map("<leader>gd", vim.lsp.buf.definition, "Ir a definicion")
                                        map("<leader>gr", vim.lsp.buf.references, "Referencias")
                                        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                                        map("<leader>rn", vim.lsp.buf.rename, "Renombrar")

                                        map("<leader>f", function()
                                                local conform = require("conform")
                                                local formatters = conform.list_formatters_for_buffer(0)

                                                if #formatters > 0 then
                                                        conform.format({
                                                                async = true,
                                                                lsp_format = "fallback",
                                                                timeout_ms = 1000,
                                                        })
                                                else
                                                        vim.lsp.buf.format({ async = true })
                                                end
                                        end, "Formatear")
                                end,
                        })
                end,
        },
}
