return {
    "vim-airline/vim-airline",
    dependencies = {
        "vim-airline/vim-airline-themes"
    },
    config = function()
        vim.cmd('let g:airline_theme = "apprentice"')
    end,
}
