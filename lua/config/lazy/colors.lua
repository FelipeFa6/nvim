function ColorMyPencils(color)
    color = color or "menguless"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "zekzekus/menguless",
        name = "menguless",
        config = function()
            vim.cmd("colorscheme menguless")
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
