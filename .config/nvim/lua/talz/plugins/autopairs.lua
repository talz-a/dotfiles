return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = "windwp/nvim-ts-autotag",
	config = function()
		require("nvim-autopairs").setup({ check_ts = true })
		require("nvim-ts-autotag").setup()
	end,
}
