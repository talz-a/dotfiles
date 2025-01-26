return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		require("cmp").setup({
			completeopt = "menu,menuone,noselect",
			preselect = require("cmp").PreselectMode.None,
			mapping = require("cmp").mapping.preset.insert({
				["<C-k>"] = require("cmp").mapping.select_prev_item(),
				["<C-j>"] = require("cmp").mapping.select_next_item(),
			}),
			sources = require("cmp").config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
