require("ibl").setup() -- ident-blank-line

require("nvim-surround").setup()

require("oil").setup({
  keymaps = {
    ["<Esc>"] = "actions.close",
  },
})

require("telescope").setup({})
