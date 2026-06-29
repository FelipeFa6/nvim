return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				cpp = { "clang_format" },
				c = { "clang_format" },
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				python = { "black" },
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {},
			handlers = {
				function(server)
					require("lspconfig")[server].setup({})
				end,
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.keymap.set("n", "<leader>f", function()
				require("conform").format({
					lsp_fallback = true,
					async = true,
				})
			end)

			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end)
		end,
	},
}
