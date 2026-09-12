return {
        "nvim-lualine/lualine.nvim",
        dependencies = { "milanglacier/minuet-ai.nvim" },
        config = function()
                require("lualine").setup({
                        sections = {
                                lualine_x = {
                                        -- Estado del toggle
                                        {
                                                function()
                                                        return "AI " .. (vim.g.minuet_auto and "ON" or "OFF")
                                                end,
                                                color = function()
                                                        return { fg = vim.g.minuet_auto and "#a6e3a1" or "#6c7086" }
                                                end,
                                        },
                                        -- Componente nativo: modelo + spinner mientras hay requests
                                        {
                                                require("minuet.lualine"),
                                                display_name = "model",
                                                display_on_idle = false,
                                        },
                                        "encoding",
                                        "fileformat",
                                        "filetype",
                                },
                        },
                })
        end,
}
