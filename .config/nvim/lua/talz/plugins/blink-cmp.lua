return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<C-j>"] = {
				function(cmp)
					if cmp.is_menu_visible() then
						cmp.select_next()
					else
						cmp.show()
						vim.defer_fn(function()
							cmp.select_next()
						end, 10)
					end
				end,
			},
			["<C-k>"] = { "select_prev", "fallback" },
		},
		completion = {
			menu = {
				auto_show = false,
			},
			trigger = {
				show_on_insert_on_trigger_character = false,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			documentation = { auto_show = false },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
