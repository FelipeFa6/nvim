return {
        {
                "williamboman/mason.nvim",
                opts = {},
        },

        {
                "stevearc/conform.nvim",
                opts = {
                        formatters_by_ft = {
                                cpp = { "clang_format" },
                                c = { "clang_format" },
                                lua = { "stylua" },
                                javascript = { "prettier" },
                                typescript = { "prettier" },
                                python = { "black" },
                        },
                },
        },

        {
                "williamboman/mason-lspconfig.nvim",
                dependencies = {
                        "williamboman/mason.nvim",
                        "neovim/nvim-lspconfig",
                },
                opts = {
                        ensure_installed = {},
                        handlers = {
                                function(server)
                                        require("lspconfig")[server].setup({})
                                end,
                        },
                },
        },

        {
                "neovim/nvim-lspconfig",
                config = function()
                        vim.keymap.set("n", "<leader>f", function()
                                require("conform").format({ lsp_format = "fallback", async = true })
                        end)

                        vim.api.nvim_create_autocmd("LspAttach", {
                                callback = function(args)
                                        local opts = { buffer = args.buf }

                                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                                        -- vim.keymap.set("n", "gd", function()
                                        --         vim.lsp.buf.definition({
                                        --                 on_list = function(list)
                                        --                         if not list.items or #list.items == 0 then
                                        --                                 vim.notify("No definition found",
                                        --                                         vim.log.levels.WARN)
                                        --                                 return
                                        --                         end
                                        --                         vim.cmd("vsplit")
                                        --                         vim.fn.setqflist({}, " ", list)
                                        --                         vim.cmd("cfirst")
                                        --                         if #list.items > 1 then
                                        --                                 vim.cmd("copen")
                                        --                         end
                                        --                 end,
                                        --         })
                                        -- end, opts)
                                end,
                        })
                end,
        },
}
