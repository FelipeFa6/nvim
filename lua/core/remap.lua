-- buffer motion
vim.keymap.set("n", "<C-n>", vim.cmd.Vexplore);
vim.keymap.set("n", "<C-t>", vim.cmd.Texplore);

-- higlight
vim.keymap.set("n", "<leader>h", vim.cmd.nohl);

-- EasyAlign
vim.keymap.set("v", "ga", "<Plug>(EasyAlign)");
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)");
