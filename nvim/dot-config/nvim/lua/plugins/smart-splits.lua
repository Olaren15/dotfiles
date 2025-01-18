return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move to left window",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move to down window",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move to up window",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move to right window",
      },
      {
        "<C-S-h>",
        function()
          require("smart-splits").resize_left()
        end,
        desc = "Move to left window",
      },
      {
        "<C-S-j>",
        function()
          require("smart-splits").resize_down()
        end,
        desc = "Move to down window",
      },
      {
        "<C-S-k>",
        function()
          require("smart-splits").resize_up()
        end,
        desc = "Move to up window",
      },
      {
        "<C-S-l>",
        function()
          require("smart-splits").resize_right()
        end,
        desc = "Move to right window",
      },
    },
  },
}
