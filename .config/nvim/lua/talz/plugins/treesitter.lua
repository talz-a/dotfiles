return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = "RRethy/nvim-treesitter-endwise",
    config = function()
        require("nvim-treesitter.configs").setup({
            endwise = {
                enable = true,
            },
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "vimdoc",
                "go",
                "python",
                "c",
                "cpp",
                "rust",
                "elixir",
            },
            sync_install = false,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
