return {
	"ibhagwan/fzf-lua",

	opts = {},

	config = function(_, opts)
		local fzf = require("fzf-lua")

		fzf.setup(opts)

		local map = vim.keymap.set

		local function bind(lhs, rhs, desc)
			map("n", lhs, rhs, { desc = desc })
		end

		bind("<leader>pf", fzf.files, "Files")
		bind("<leader>ps", fzf.live_grep, "Search")
		bind("<leader>pb", fzf.buffers, "Buffers")

        bind("<leader>pr", function()
            local libs = {}

            for _, path in ipairs(vim.fn.glob("/usr/include/*", false, true)) do
                if vim.fn.isdirectory(path) == 1 then
                    libs[vim.fn.fnamemodify(path, ":t")] = path
                end
            end

            fzf.fzf_exec(vim.tbl_keys(libs), {
                prompt = "Library> ",
                actions = {
                    ["default"] = function(selected)
                        local lib = selected[1]
                        if not lib then return end

                        local cwd = libs[lib]

                        local query = vim.fn.input(lib .. "> ")
                        if query == "" then return end

                        local pattern = vim.fn.escape(query, "\\")

                        fzf.fzf_exec(
                            "rg -F --line-number --column --no-heading --color=never " ..
                            "-g '*.h' -g '*.hpp' " ..
                            "-- " .. vim.fn.shellescape(pattern) .. " " ..
                            vim.fn.shellescape(cwd),
                            {
                                prompt = lib .. "> ",

                                actions = {
                                    ["default"] = function(lines)
                                        local line = lines[1]
                                        if not line then return end

                                        -- parse: file:line:col:text
                                        local file, lnum, col = line:match("^(.-):(%d+):(%d+):")

                                        if file then
                                            vim.cmd("edit " .. file)
                                            vim.api.nvim_win_set_cursor(0, { tonumber(lnum), tonumber(col) - 1 })
                                        end
                                    end,
                                },
                            }
                        )
                    end,
                },
            })
        end, "Search References")

		bind("gd", fzf.lsp_definitions, "Go to definition")
		bind("gD", fzf.lsp_declarations, "Go to declaration")
		bind("gr", fzf.lsp_references, "References")
		bind("gi", fzf.lsp_implementations, "Implementations")
		bind("gt", fzf.lsp_typedefs, "Type definition")
	end,
}
