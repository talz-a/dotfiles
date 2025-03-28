return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("rose-pine").setup({
            variant = "main",
            styles = {
                bold = true,
                italic = false,
                transparency = true,
            },
            palette = {
                main = {
                    love = "#eb6f92",
                    gold = "#f9bd98",
                    rose = "#ebbcba",
                    pine = "#7f9f9f",
                    foam = "#bedfe0",
                    iris = "#debee2",
                    leaf = "#95b1ac",
                },
            },
        })
        vim.cmd("colorscheme rose-pine")
    end
}
