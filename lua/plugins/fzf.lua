return {
    "ibhagwan/fzf-lua",
    keys = {
        {
            "<C-x><C-f>",
            function()
                require("fzf-lua").complete_path()
            end,
            mode = {
                "n", "v", "i"
            },
            silent = true
        },

        -- Git search
        {
            "<C-p>",
            function()
                require("fzf-lua").git_files()
            end,
            mode = "n",
            silent = true
        },

        -- word search
        {
            "<leader>ps",
            function()
                require("fzf-lua").grep_project()
            end,
            mode = "n",
            silent = true
        },
    },
}

