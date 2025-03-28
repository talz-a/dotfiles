return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    n = {
                        ["d"] = require("telescope.actions").delete_buffer,
                        ["q"] = require("telescope.actions").close,
                    },
                    i = {
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-q>"] = require("telescope.actions").send_selected_to_qflist
                            + require("telescope.actions").open_qflist,
                    },
                },
            },
            pickers = {
                oldfiles = { disable_devicons = true, theme = "dropdown" },
                find_files = { disable_devicons = true, theme = "dropdown" },
                live_grep = { disable_devicons = true, theme = "dropdown" },
                grep_string = { disable_devicons = true, theme = "dropdown" },
            },
        })
        require("telescope").load_extension("fzf")
        local builtin = require "telescope.builtin"
        vim.keymap.set("n", "<leader>ff", builtin.find_files)
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles)
        vim.keymap.set("n", "<leader>fs", builtin.live_grep)
        vim.keymap.set("n", "<leader>fc", builtin.grep_string)
        vim.keymap.set("n", "<leader>k", function()
            require("telescope.builtin").buffers(require("telescope.themes").get_ivy({
                sort_mru = true,
                disable_devicons = true,
                sort_lastused = true,
                initial_mode = "normal",
                layout_config = { preview_width = 0.4 },
            }))
        end)
    end,
}
