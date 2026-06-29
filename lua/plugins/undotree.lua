return {
	"jiaoshijie/undotree",

	config = function()
		require("undotree").setup({
			float_diff = false,
		})
	end,

	keys = {
		{
			"<leader>u",
			function()
				require("undotree").toggle()
			end,
		},
	},
}
