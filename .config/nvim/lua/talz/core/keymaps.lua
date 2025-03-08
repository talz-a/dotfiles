vim.keymap.set("n", "i", function()
    return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "cc" or "i"
end, { expr = true, noremap = true })

vim.keymap.set("n", "<leader>w", ":w<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":bdelete<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Q", ":xa<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>")

vim.keymap.set("n", "<leader>+", "<Cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<leader>-", "<Cmd>vertical resize -5<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("i", "<C-j>", "<C-n>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<C-p>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-j>", "<C-n>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-k>", "<C-p>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
