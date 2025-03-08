return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("cmp").setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            preselect = require("cmp").PreselectMode.None,
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = require("cmp").mapping.preset.insert({
                ["<C-j>"] = require("cmp").mapping.select_next_item(),
                ["<C-k>"] = require("cmp").mapping.select_prev_item(),
                ["<C-e>"] = require("cmp").mapping.abort(),
                ["<C-y>"] = require("cmp").mapping(
                    require("cmp").mapping.confirm({
                        select = true,
                    }),
                    { "i", "c" }
                ),
            }),
            sources = require("cmp").config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })
        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            if require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
            end
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-h>", function()
            if require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
            end
        end, { silent = true })
    end,
}
