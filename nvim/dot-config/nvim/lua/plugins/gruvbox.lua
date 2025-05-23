return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        overrides = {
          -- Keep red for errors
          Statement = { link = "GruvboxPurple" },
          Conditional = { link = "GruvboxPurple" },
          Repeat = { link = "GruvboxPurple" },
          Label = { link = "GruvboxPurple" },
          Exception = { link = "GruvboxPurple" },
          Keyword = { link = "GruvboxPurple" },
          ["@keyword.operator"] = { link = "GruvboxPurple" },
        },
      })

      vim.cmd.colorscheme("gruvbox")

      -- better diff
      vim.api.nvim_set_hl(0, "DiffAdd", { fg = "none", bg = "#2e4b2e", bold = true })
      vim.api.nvim_set_hl(0, "DiffDelete", { fg = "none", bg = "#4c1e15", bold = true })
      vim.api.nvim_set_hl(0, "DiffChange", { fg = "none", bg = "#45565c", bold = true })
      vim.api.nvim_set_hl(0, "DiffText", { fg = "none", bg = "#996d74", bold = true })
    end,
  },
}
