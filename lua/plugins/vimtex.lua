return {
        "lervag/vimtex",
        lazy = false,     -- VimTeX recomienda NO cargarlo lazy
        init = function()
                vim.g.vimtex_view_method = "zathura"

                -- compilación continua con latexmk
                vim.g.vimtex_compiler_method = "latexmk"
                vim.g.vimtex_compiler_latexmk = {
                        continuous = 1,
                        options = {
                                "-pdf",
                                "-shell-escape",
                                "-interaction=nonstopmode",
                                "-synctex=1",
                        },
                }
        end,
}
