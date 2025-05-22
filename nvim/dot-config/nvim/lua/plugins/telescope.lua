return {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { "<leader>sf", require("telescope.builtin").find_files,  { desc = "[s]earch [f]iles" } },
        { "<leader>sg", require("telescope.builtin").live_grep,   { desc = "[s]earch with [g]rep" } },
        { "<leader>sb", require("telescope.builtin").buffers,     { desc = "[s]earch [b]uffers" } },
        { "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[s]earch [d]iagnostics" } },
        { "<leader>sp", require("telescope.builtin").planets,     { desc = "[s]earch [p]lanets..." } },
    }
}
