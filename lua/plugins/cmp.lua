return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "garymjr/nvim-snippets",
    },
    opts = function()
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()
        local select_opts = { behavior = cmp.SelectBehavior.Insert }

        return {
            completion = {
                completeopt = "menu,menuone,noinsert,noselect",
            },
            preselect = cmp.PreselectMode.Item,
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
                ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                ["<C-CR>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
            formatting = {
                format = function(entry, item)
                    item.menu = ({
                        nvim_lsp = "[LSP]",
                        buffer = "[Buf]",
                        path = "[Path]",
                    })[entry.source.name]

                    return item
                end,
            },
            sorting = defaults.sorting,
            experimental = {
                ghost_text = false,
            },
        }
    end,
}
