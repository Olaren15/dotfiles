return {
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {},
  },
  {
    "tpope/vim-sleuth",
    event = "InsertEnter",
  },
}
