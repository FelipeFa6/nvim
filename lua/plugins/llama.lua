-- ~/.config/nvim/lua/plugins/llama.lua
-- FIM -> 8001 (1.5B) | INST -> 8002 (7B)

local srv = {
        { key = 'FIM',  url = 'http://127.0.0.1:8001/health', ok = nil },
        { key = 'INST', url = 'http://127.0.0.1:8002/health', ok = nil },
}

local function check()
        for _, s in ipairs(srv) do
                vim.system({ 'curl', '-sf', '-m', '2', '-o', '/dev/null', s.url }, {}, function(r)
                        local nuevo = r.code == 0
                        if nuevo ~= s.ok then
                                s.ok = nuevo
                                vim.schedule(function() vim.cmd('redrawstatus') end)
                        end
                end)
        end
end

function _G.llama_status()
        local out = {}
        for _, s in ipairs(srv) do
                out[#out + 1] = s.key .. ':' .. (s.ok == nil and '?' or (s.ok and 'ok' or 'X'))
        end
        return table.concat(out, ' ')
end

return {
        'ggml-org/llama.vim',
        lazy = false,
        init = function()
                vim.g.llama_config = {
                        endpoint_fim  = 'http://127.0.0.1:8001/infill',
                        endpoint_inst = 'http://127.0.0.1:8002/v1/chat/completions',
                        auto_fim = true,
                        show_info = 2,
                        t_max_prompt_ms  = 1500,
                        t_max_predict_ms = 1500,
                        n_predict = 24,
                        n_prefix = 128,
                        n_suffix = 32,
                        ring_n_chunks   = 0,
                        ring_update_ms  = 5000,
                        keymap_fim_trigger     = '<leader>llf',
                        keymap_fim_accept_full = '<Tab>',
                        keymap_fim_accept_line = '<S-Tab>',
                        keymap_inst_trigger  = '<leader>lli',
                        keymap_inst_retry    = '<leader>llr',
                        keymap_inst_continue = '<leader>llc',
                        keymap_inst_accept   = '<Tab>',
                        keymap_inst_cancel   = '<Esc>',
                }
        end,
        config = function()
                vim.api.nvim_create_user_command('LlamaStatus', check, {})
                check()
                vim.uv.new_timer():start(60000, 60000, vim.schedule_wrap(check))
                vim.o.statusline = vim.o.statusline .. ' [%{v:lua.llama_status()}]'
        end,
}
