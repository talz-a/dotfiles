return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"nvim-telescope/telescope.nvim",
		{ "williamboman/mason.nvim", config = true },
		{ "williamboman/mason-lspconfig.nvim", config = true },
		{ "folke/lazydev.nvim", config = true },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
				vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
				vim.keymap.set("n", "gi", builtin.lsp_implementations, { buffer = 0 })
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
				vim.keymap.set("n", "<leader>D", builtin.diagnostics, { buffer = 0 })
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = 0 })
				vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = 0 })
			end,
		})
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = require("blink.cmp").get_lsp_capabilities(),
				})
			end,
		})
	end,
}
