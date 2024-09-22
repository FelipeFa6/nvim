return {
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        name = "zenbones",
        config = function()
            vim.g.zenwritten = {
                solid_line_nr = true,
                darken_comments = 45,
                lightness = 'dim',
            }
            vim.cmd("colorscheme zenwritten")
        end,
    },
}

