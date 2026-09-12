-- ~/.config/nvim/lua/plugins/minuet-ai.lua
return {
        "milanglacier/minuet-ai.nvim",
        lazy = false,
        config = function()
                -- Estado global del auto-complete. Apagado por defecto.
                -- Toggle con <leader>mt. La invocación manual (<A-]>) siempre funciona.
                vim.g.minuet_auto = false

                require("minuet").setup({
                        -- Proveedor FIM para DeepSeek
                        provider = "openai_fim_compatible",
                        provider_options = {
                                openai_fim_compatible = {
                                        api_key = "DEEPSEEK_NVIM_API_KEY", -- nombre de la variable de entorno, no el valor
                                        end_point = "https://api.deepseek.com/beta/completions",
                                        model = "deepseek-v4-flash", -- si el endpoint FIM lo rechaza, usa "deepseek-v4-pro"
                                        name = "Deepseek",
                                        stream = true,
                                        optional = {
                                                max_tokens = 256,
                                                top_p = 0.9,
                                                temperature = 0.2,
                                                stop = { "\n\n" }, -- corta en el primer bloque en blanco
                                        },
                                },
                        },

                        -- Controles de costos y red
                        request_timeout = 3,
                        throttle = 1500,
                        debounce = 600,
                        context_window = 12000, -- caracteres (~3000 tokens)
                        context_ratio = 0.75,
                        n_completions = 1,

                        -- Condiciones para el auto-trigger. Si alguna devuelve false, no se hace el request.
                        -- No afectan a la invocación manual.
                        enable_predicates = {
                                -- 1. Toggle global
                                function()
                                        return vim.g.minuet_auto
                                end,
                                -- 2. No pedir sugerencias dentro de comentarios (requiere parser de treesitter)
                                function()
                                        local ok, node = pcall(vim.treesitter.get_node)
                                        if not ok or not node then
                                                return true
                                        end
                                        while node do
                                                if node:type():find("comment") then
                                                        return false
                                                end
                                                node = node:parent()
                                        end
                                        return true
                                end,
                        },

                        -- Frontend: virtual text
                        virtualtext = {
                                -- Lenguajes donde el auto-trigger aplica (cuando vim.g.minuet_auto == true)
                                auto_trigger_ft = {
                                        "ruby", "eruby",
                                        "python", "lua",
                                        "javascript", "typescript",
                                        "c", "cpp", "go", "rust",
                                },
                                -- Teclas Alt: no chocan con nvim-cmp ni con los defaults de Vim.
                                -- En macOS hay que activar "Option as Meta/Alt" en la terminal.
                                keymap = {
                                        accept = "<A-A>",         -- Alt+Shift+a: aceptar toda la sugerencia
                                        accept_line = "<A-a>",    -- Alt+a: aceptar solo la línea actual
                                        accept_n_lines = "<A-z>", -- Alt+z: aceptar N líneas (pregunta número)
                                        next = "<A-]>",           -- Alt+]: siguiente sugerencia / invocar manualmente
                                        prev = "<A-[>",           -- Alt+[: sugerencia anterior
                                        dismiss = "<A-e>",        -- Alt+e: descartar
                                },
                                show_on_completion_menu = false,
                        },

                        notify = "warn", -- cambia a "debug" para diagnosticar errores de la API
                })

                -- Toggle global del auto-complete
                vim.keymap.set("n", "<leader>mt", function()
                        vim.g.minuet_auto = not vim.g.minuet_auto
                        vim.notify("Minuet auto-complete: " .. (vim.g.minuet_auto and "ON" or "OFF"))
                end, { desc = "Minuet: toggle auto-complete" })

                -- Invocar sugerencia manualmente desde modo normal
                vim.keymap.set("n", "<leader>m", function()
                        require("minuet.virtualtext").action.next()
                end, { desc = "Minuet: pedir sugerencia" })
        end,
}
