return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = "RRethy/nvim-treesitter-endwise",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			endwise = { enable = true },
			ensure_installed = "all",
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
