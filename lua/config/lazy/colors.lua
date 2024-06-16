function ColorMyPencils(color)
	color = color or "off"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "ntk148v/komau.vim",
        name = "komau",
        config = function()
            vim.cmd("colorscheme komau")
            ColorMyPencils(name)
        end
    },
    {
        "pbrisbin/vim-colors-off",
        name = "off",
        config = function()
            vim.cmd("colorscheme off")
            ColorMyPencils(name)
        end
    },
}
