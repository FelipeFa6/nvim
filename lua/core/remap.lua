-- buffer motion
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);
vim.keymap.set("n", "<C-n>", vim.cmd.Vexplore);
vim.keymap.set("n", "<C-t>", vim.cmd.Texplore);
vim.keymap.set("n", "<S-h>", vim.cmd.tabprevious);
vim.keymap.set("n", "<S-l>", vim.cmd.tabnext);

-- higlight
vim.keymap.set("n", "<leader>h", vim.cmd.nohl);

-- EasyAlign
vim.keymap.set("v", "ga", "<Plug>(EasyAlign)");
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)");
