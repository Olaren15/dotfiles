return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>sf", function() require("telescope.builtin").find_files() end,  { desc = "[s]earch [f]iles" } },
        { "<leader>sg", function() require("telescope.builtin").live_grep() end,   { desc = "[s]earch with [g]rep" } },
        { "<leader>sb", function() require("telescope.builtin").buffers() end,     { desc = "[s]earch [b]uffers" } },
        { "<leader>sd", function() require("telescope.builtin").diagnostics() end, { desc = "[s]earch [d]iagnostics" } },
        { "<leader>sp", function() require("telescope.builtin").planets() end,     { desc = "[s]earch [p]lanets..." } },
    },
}
