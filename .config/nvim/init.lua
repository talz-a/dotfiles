vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

if vim.g.neovide then
    vim.o.guifont = "Lucida Console:h12"
    vim.g.neovide_scale_factor = 1.0
    local change_scale = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function() change_scale(1.1) end)
    vim.keymap.set("n", "<C-->", function() change_scale(0.9) end)
    vim.keymap.set("n", "<C-0>", function() vim.g.neovide_scale_factor = 1.0 end)
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_hide_mouse_when_typing = true
end

vim.keymap.set('t', '<A-Esc>', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-h>', [[<C-\><C-n>:TmuxNavigateLeft<CR>]], { silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n>:TmuxNavigateDown<CR>]], { silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n>:TmuxNavigateUp<CR>]], { silent = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n>:TmuxNavigateRight<CR>]], { silent = true })
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
    group = vim.api.nvim_create_augroup("terminal_setup", { clear = true }),
    pattern = "term://*",
    callback = function()
        vim.cmd("startinsert")
    end,
})
vim.keymap.set('n', '<leader>t', function()
    vim.cmd('vsplit')
    vim.cmd('wincmd l')
    vim.cmd('terminal')
end)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.scrolloff = 10

vim.opt.termguicolors = true
vim.cmd.colorscheme("jblow")

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.cinoptions:append("L0")

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.clipboard:append("unnamedplus")

vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v", "x" }, "<leader>s", ":e #<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>S", ":vert sf #<CR>")

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "p", '"_dp')

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>+", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -5<CR>")

vim.keymap.set("n", "i", function()
    return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "cc" or "i"
end, { expr = true, remap = false })

vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
end)

vim.api.nvim_create_augroup("userconfigs", { clear = true })

vim.api.nvim_create_autocmd("VimResized", {
    group = "userconfigs",
    pattern = "*",
    callback = function()
        vim.cmd.wincmd("=")
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    group = "userconfigs",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = "userconfigs",
    callback = function()
        vim.highlight.on_yank()
    end,
})

require("lazy").setup({
    -- {
    --     -- "pappasam/papercolor-theme-slim",
    --     -- "sainnhe/sonokai",
    --     -- "ellisonleao/gruvbox.nvim",
    --     -- "RostislavArts/naysayer.nvim",
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- vim.api.nvim_create_autocmd("ColorScheme", {
    --         --     pattern = "PaperColorSlim",
    --         --     callback = function()
    --         --         vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Normal" })
    --         --         vim.api.nvim_set_hl(0, "Delimiter", { link = "Normal" })
    --         --     end,
    --         -- })
    --         -- vim.cmd.colorscheme("PaperColorSlim")
    --         -- vim.g.sonokai_enable_italic = false
    --         -- vim.g.sonokai_disable_italic_comment = true
    --         -- vim.g.sonokai_transparent_background = true
    --         -- vim.cmd.colorscheme("sonokai")
    --         -- require("gruvbox").setup({
    --         --     terminal_colors = true,
    --         --     undercurl = true,
    --         --     underline = true,
    --         --     bold = true,
    --         --     italic = {
    --         --         strings = false,
    --         --         emphasis = false,
    --         --         comments = false,
    --         --         operators = false,
    --         --         folds = false,
    --         --     },
    --         --     strikethrough = true,
    --         --     invert_selection = false,
    --         --     invert_signs = false,
    --         --     invert_tabline = false,
    --         --     inverse = true, -- invert background for search, diffs, statuslines and errors
    --         --     contrast = "",  -- can be "hard", "soft" or empty string
    --         --     palette_overrides = {},
    --         --     overrides = {},
    --         --     dim_inactive = false,
    --         --     transparent_mode = true,
    --         -- })
    --         -- vim.cmd("colorscheme gruvbox")
    --         -- vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Normal" })
    --         -- vim.api.nvim_set_hl(0, "Delimiter", { link = "Normal" })
    --         -- vim.cmd.colorscheme("tokyonight")
    --         require("tokyonight").setup({
    --             style = "storm",
    --             transparent = true,
    --             terminal_colors = true,
    --             styles = {
    --                 comments = { italic = false },
    --                 keywords = { italic = false },
    --                 -- Background styles. Can be "dark", "transparent" or "normal"
    --                 sidebars = "transparent", -- style for sidebars, see below
    --                 floats = "transparent",   -- style for floating windows
    --             },
    --         })
    --         vim.cmd.colorscheme("tokyonight")
    --     end
    -- },
    -- {
    --     "pebeto/dookie.nvim",
    --     priority = 1000,
    --     lazy = false,
    --     config = function()
    --         vim.cmd.colorscheme("dookie")
    --     end
    -- },
    { "christoomey/vim-tmux-navigator" },
    { "tpope/vim-surround" },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                format_on_save = {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
            })
        end,
    },
    {
        "stevearc/oil.nvim",
        lazy = false,
        config = function()
            require("oil").setup({
                columns = {
                    "permissions",
                    "size",
                    "mtime"
                },
                view_options = {
                    show_hidden = true,
                },
            })
            vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    disable_devicons = true,
                },
                extensions = {
                    fzf = {}
                }
            })
            require("telescope").load_extension("fzf")
            vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
            vim.keymap.set("n", "<leader>fr", require("telescope.builtin").oldfiles)
            vim.keymap.set("n", "<leader>fs", require("telescope.builtin").live_grep)
            vim.keymap.set("n", "<leader>fc", require("telescope.builtin").grep_string)
            vim.keymap.set("n", "<leader>k", require("telescope.builtin").buffers)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup()
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = require("blink.cmp")
                                .get_lsp_capabilities()
                        })
                    end,
                },

            })
        end,
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = {
            signature = {
                enabled = true
            },
            completion = {
                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind" }
                        },
                    },
                },
            },
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { buffer = args.buf })
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { buffer = args.buf })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf })
        vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, { buffer = args.buf })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = args.buf })
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = args.buf })
        vim.keymap.set("n", "<leader>D", require("telescope.builtin").diagnostics, { buffer = args.buf })
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = args.buf })
        vim.keymap.set("n", "<space>wd", require("telescope.builtin").lsp_document_symbols, { buffer = args.buf })
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "cpp" },
    callback = function()
        vim.treesitter.start()
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
