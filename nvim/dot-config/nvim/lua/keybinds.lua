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

-- Formatting
vim.keymap.set("n", "<leader>rf", function()
  require("conform").format({ async = true })
end, { desc = "[r]e [f]ormat" })

-- oil
vim.keymap.set("n", "<leader>e", function()
  require("oil").open()
end, { desc = "[e]xplore files" })

-- telescope
vim.keymap.set("n", "<leader>sf", function()
  require("telescope.builtin").find_files()
end, { desc = "[s]earch [f]iles" })
vim.keymap.set("n", "<leader>sg", function()
  require("telescope.builtin").live_grep()
end, { desc = "[s]earch with [g]rep" })

-- nvim-treesitter-textobjects
-- selection
vim.keymap.set({ "x", "o" }, "af", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "agc", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "igc", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@comment.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "aa", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ia", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "aga", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@attribute.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "iga", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@attribute.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "as", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@statement.outer", "textobjects")
end)

-- move
vim.keymap.set({ "n", "x", "o" }, "]f", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[f", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]c", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[c", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]gc", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@comment.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[gc", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@comment.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]a", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[a", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]ga", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@attribute.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[ga", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@attribute.outer", "textobjects")
end)
