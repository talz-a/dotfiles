return {
    "alljokecake/naysayer-theme.nvim",
    as = "naysayer",
    lazy = false,
    priority = 1000,
    config = function()
        require('naysayer').setup({
            variant = 'main',
            dark_variant = 'main',
            bold_vert_split = false,
            dim_nc_background = false,
            disable_background = true,
            disable_float_background = true,
            disable_italics = true,
        })
        vim.cmd("colorscheme naysayer")
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    end,
}
