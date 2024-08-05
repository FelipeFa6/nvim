function ColorMyPencils(color)
    color = color or "fogbell_lite"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "Alligator/accent.vim",
        name = "accent",
        config = function()
            vim.g.accent_colour = 'green'
            vim.cmd("colorscheme accent")
            ColorMyPencils(name)
        end
    },
    {
        "jaredgorski/fogbell.vim",
        name = "fogbell",
        config = function()
            vim.cmd("colorscheme fogbell")
            ColorMyPencils(name)
        end
    },
}
