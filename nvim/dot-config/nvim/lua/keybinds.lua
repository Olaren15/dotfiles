-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Easier pane navigation
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Hide highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
