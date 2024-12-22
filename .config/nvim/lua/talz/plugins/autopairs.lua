return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "windwp/nvim-ts-autotag"
    },
    config = function()
        require("nvim-autopairs").setup({ check_ts = true })
        require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		require("nvim-ts-autotag").setup()
    end,
}
