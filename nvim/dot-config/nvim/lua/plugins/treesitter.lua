return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    main = "nvim-treesitter.configs",
    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["agc"] = "@comment.outer",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["as"] = "@statement.outer",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]gc"] = "@comment.outer",
            ["]a"] = "@parameter.inner",
            ["]r"] = "@return.outer",
            ["]s"] = "@statement.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]gC"] = "@comment.outer",
            ["]A"] = "@parameter.inner",
            ["]R"] = "@return.outer",
            ["]S"] = "@statement.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[gc"] = "@comment.outer",
            ["[a"] = "@parameter.inner",
            ["[r"] = "@return.outer",
            ["[s"] = "@statement.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[gC"] = "@comment.outer",
            ["[A"] = "@parameter.inner",
            ["[R"] = "@return.outer",
            ["[S"] = "@statement.outer",
          },
        },
      },
    },
  },
}
