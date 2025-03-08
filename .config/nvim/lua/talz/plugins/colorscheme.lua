return {
    "p00f/alabaster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.opt.rtp:prepend("~/.config/nvim/colors/gruber-darker.nvim")
        vim.cmd.colorscheme("defaults_override")
    end
}
