return {
	"maxmx03/solarized.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("solarized").setup({
			styles = {
				enabled = true,
				types = { italic = false },
				functions = { italic = false },
				parameters = { italic = false },
				comments = { italic = false },
				strings = { italic = false },
				keywords = { italic = false },
				variables = { italic = false },
				constants = { italic = false },
			},
		})
		vim.cmd.colorscheme("solarized")
	end,
}
