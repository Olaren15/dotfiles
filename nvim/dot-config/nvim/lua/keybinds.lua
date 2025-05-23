-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Panes
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

vim.keymap.set("n", "<A-v>", ":sp<cr>", { desc = "[v]ertical split" })
vim.keymap.set("n", "<A-b>", ":vsp<cr>", { desc = "horizontal split" })

vim.keymap.set("n", "<leader>w", "<C-w>")

-- Buffers
vim.keymap.set("n", "<A-n>", ":bn<cr>", { desc = "[n]ext buffer" })
vim.keymap.set("n", "<A-p>", ":bp<cr>", { desc = "[p]revious buffer" })
vim.keymap.set("n", "<A-d>", ":bd<cr>", { desc = "[d]elete buffer" })

-- Hide highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Useful keybind
vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float, { desc = "Open diagnostic infos" })
