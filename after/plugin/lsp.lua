local cmp = require('cmp')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "cmake",
        "rust_analyzer",
        "phpactor"
    },
    handlers = {
        ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.4" },
                        diagnostics = {
                            globals = { "vim", "it", "describe", "before_each", "after_each" },
                        }
                    }
                }
            }
        end,

        require('lspconfig').rust_analyzer.setup{
            cmd = { "rustup", "run", "stable", "rust-analyzer", }
        },

        require('lspconfig').clangd.setup{},
    },
})

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = {
        ['<C-p>']     = cmp.mapping.select_prev_item(),
        ['<C-n>']     = cmp.mapping.select_next_item(),
        ['<C-y>']     = cmp.mapping.confirm({select = true}),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
