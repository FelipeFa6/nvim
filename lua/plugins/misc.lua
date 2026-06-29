return {
	"mcauley-penney/visual-whitespace.nvim",
	opts = {
		enabled = true,
		highlight = { link = "Whitespace", default = true },

		match_types = {
			space = true,
			tab = true,
			nbsp = true,
			lead = true,
			trail = true,
		},

		list_chars = {
			space = ".",
			tab = ">",
			nbsp = "N",
			lead = "|",
			trail = "_",
		},

		fileformat_chars = {
			unix = "LF",
			mac = "CR",
			dos = "CRLF",
		},

		ignore = {
			filetypes = {},
			buftypes = {},
		},
	},
}
