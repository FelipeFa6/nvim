return {
    "ibhagwan/fzf-lua", opts = {
        vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>",
        function() require("fzf-lua").complete_path() end,
        { silent = true }),

        vim.keymap.set({ "n" }, "<leader>pv",
        function() require("fzf-lua").files() end,
        { silent = true }),

        vim.keymap.set({ "n" }, "<C-p>",
        function() require("fzf-lua").git_files() end,
        { silent = true }),

    }
}
