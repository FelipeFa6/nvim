return {
        {
                "hrsh7th/nvim-cmp",
                dependencies = {
                        "hrsh7th/cmp-nvim-lsp",
                },
                config = function()
                        local cmp = require("cmp")
                        local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
                        local overrides = { Constructor = "ctor", TypeParameter = "tprm", EnumMember = "emem" }
                        local function scroll(delta)
                                return cmp.mapping(function(fallback)
                                        if cmp.visible() then cmp.scroll_docs(delta) else fallback() end
                                end, { "i", "s" })
                        end
                        cmp.setup({
                                snippet = { expand = function(a) vim.snippet.expand(a.body) end },
                                window = {
                                        completion = { border = border, scrollbar = false, col_offset = -3, side_padding = 1 },
                                        documentation = { border = border, max_height = 25, max_width = 90 },
                                },
                                formatting = {
                                        fields = { "kind", "abbr", "menu" },
                                        format = function(entry, item)
                                                local kind = overrides[item.kind] or item.kind:sub(1, 4):lower()
                                                item.kind = string.format(" %-4s ", kind)
                                                item.menu = "  " .. entry.source.name:gsub("nvim_", "")
                                                item.abbr = #item.abbr > 40 and item.abbr:sub(1, 39) .. "…" or item.abbr
                                                return item
                                        end,
                                },
                                experimental = { ghost_text = true },
                                mapping = cmp.mapping.preset.insert({
                                        ["<C-Space>"] = cmp.mapping.complete(),
                                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                                        ["<C-n>"] = cmp.mapping.select_next_item(),
                                        ["<C-p>"] = cmp.mapping.select_prev_item(),
                                        ["<C-d>"] = scroll(4),
                                        ["<C-u>"] = scroll(-4),
                                }),
                                sources = {
                                        {
                                                name = "nvim_lsp",
                                                entry_filter = function(entry)
                                                        return entry:get_kind() ~= cmp.lsp.CompletionItemKind.Snippet
                                                end,
                                        },
                                },
                        })
                end,
        },
        { "golang/vscode-go", ft = "go" },
}
