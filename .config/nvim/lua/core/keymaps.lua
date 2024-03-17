vim.keymap.set({ "n", "v", }, " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Faster acces to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { remap = false, desc = "[y]ank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p", { remap = false, desc = "[p]aste fromsystem clipboard" })

-- Pane navigation
vim.keymap.set("n", "<A-h>", "<C-w>h", { remap = false, desc = "Move focus left" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { remap = false, desc = "Move focus down" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { remap = false, desc = "Move focus up" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { remap = false, desc = "Move focus right" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous ([) [d]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next (]) [d]iagnostic message" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("my-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
