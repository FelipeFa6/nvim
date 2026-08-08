-- Mappings y opciones específicas por tipo de archivo

local group = vim.api.nvim_create_augroup("UserFiletypes", { clear = true })

local function ft(pattern, callback)
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = pattern,
		callback = callback,
	})
end

local function map(buf, lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
end

-- Go
ft("go", function(ev)
	map(ev.buf, "<leader>gr", "<cmd>w<CR><cmd>!go run .<CR>", "go run .")
	map(ev.buf, "<leader>gt", "<cmd>!go test ./...<CR>", "go test")
	vim.bo.expandtab = false -- Go usa tabs
end)

