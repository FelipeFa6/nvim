 vim.g.mapleader = " "

-- buffer motion
vim.keymap.set("n", "<Leader>pv", vim.cmd.Ex)

-- higlight
vim.keymap.set("n", "<Leader>h", vim.cmd.nohl)

-- EasyAlign
vim.keymap.set("v", "ga", "<Plug>(EasyAlign)")
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")

-- thank you ThePrimeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<Leader>p", "\"_dP")

vim.keymap.set("n", "<Leader>y", "\"+y")
vim.keymap.set("v", "<Leader>y", "\"+y")
vim.keymap.set("n", "<Leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<Leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<Leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<Leader>w", ":!./%<CR>")

