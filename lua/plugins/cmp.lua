return {
        {
                "hrsh7th/cmp-nvim-lsp"
        },
        {
                "L3MON4D3/LuaSnip",
                dependencies = {
                        "saadparwaiz1/cmp_luasnip",
                        "rafamadriz/friendly-snippets",
                },
        },
        {
                "hrsh7th/nvim-cmp",
                config = function()
                        local cmp = require("cmp")
                        require("luasnip.loaders.from_vscode").lazy_load()

                        cmp.setup({
                                snippet = {
                                        expand = function(args)
                                                require("luasnip").lsp_expand(args.body)
                                        end,
                                },
                                window = {
                                        completion = cmp.config.window.bordered(),
                                        documentation = cmp.config.window.bordered(),
                                },
                                performance = {
                                        debounce = 60,
                                        throttle = 30,
                                        fetching_timeout = 200,
                                },
                                sorting = {
                                        priority_weight = 2,
                                        comparators = {
                                                cmp.config.compare.offset,
                                                cmp.config.compare.exact,
                                                cmp.config.compare.recently_used,
                                                cmp.config.compare.score,
                                                cmp.config.compare.kind,
                                                cmp.config.compare.sort_text,
                                                cmp.config.compare.length,
                                                cmp.config.compare.order,
                                        },
                                },
                                mapping = cmp.mapping.preset.insert({
                                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                                        ["<C-Space>"] = cmp.mapping.complete(),
                                        ["<C-e>"] = cmp.mapping.abort(),
                                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                                        -- Navegación con Tab/Shift-Tab cuando el menú está abierto
                                        ["<Tab>"] = cmp.mapping(function(fallback)
                                                if cmp.visible() then
                                                        cmp.select_next_item()
                                                else
                                                        fallback()
                                                end
                                        end, { "i", "s" }),
                                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                                                if cmp.visible() then
                                                        cmp.select_prev_item()
                                                else
                                                        fallback()
                                                end
                                        end, { "i", "s" }),
                                }),
                                sources = cmp.config.sources({
                                        { name = "nvim_lsp", priority = 1000 },
                                        { name = "luasnip", priority = 750 },
                                }, {
                                        { name = "buffer", priority = 500 },
                                        { name = "path", priority = 250 },
                                }),
                        })
                end,
        },
}
