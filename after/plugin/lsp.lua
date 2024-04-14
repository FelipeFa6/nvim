local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")

local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
)

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
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.1" },
                        diagnostics = {
                            globals = { "vim", "it", "describe", "before_each", "after_each" },
                        }
                    }
                }
            }
        end,

        ["rust_analyzer"] = function ()
            require('lspconfig').rust_analyzer.setup{
                cmd = { "rustup", "run", "stable", "rust-analyzer", }
            }
        end,

        ["phpactor"] = function ()
            require('lspconfig').phpactor.setup{
                cmd = { "phpactor", "language-server" },
                filetypes = { "php", "phtml" }
            }
        end
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
