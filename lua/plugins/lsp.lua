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
                        "neovim/nvim-lspconfig", -- debe estar en runtimepath antes del setup
                },
                opts = {
                        -- ruby_lsp NO va aquí: lo instalas con `gem install ruby-lsp`
                        -- para que respete la version de Ruby del proyecto.
                        ensure_installed = {
                                -- "lua_ls",
                        },
                        -- automatic_enable = true por defecto: habilita solo lo instalado via Mason
                },
        },

        {
                "neovim/nvim-lspconfig",
                lazy = false,
                config = function()
                        -- Capabilities de nvim-cmp para todos los servidores.
                        -- Si migras a blink.cmp, borra este bloque completo.
                        local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
                        if ok then
                                vim.lsp.config("*", {
                                        capabilities = cmp_lsp.default_capabilities(),
                                })
                        end

                        -- Servidores instalados fuera de Mason: hay que habilitarlos a mano.
                        vim.lsp.enable("ruby_lsp")

                        -- Overrides por servidor, si alguna vez los necesitas:
                        -- vim.lsp.config("ruby_lsp", {
                                --   init_options = { formatter = "rubocop" },
                                -- })

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
                                                        vim.lsp.buf.format({ async = true })
                                                end, "Formatear")
                                        end,
                                })
                        end,
                },
        }
