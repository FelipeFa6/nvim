return {
    "ibhagwan/fzf-lua",
    config = function()
        require("fzf-lua").setup({})
        vim.keymap.set("n", "<C-p>", require('fzf-lua').files)
        vim.keymap.set("n", "<leader>ps", require('fzf-lua').grep_project)
        vim.keymap.set("n", "<leader>pf", require('fzf-lua').git_files)
    end
}
