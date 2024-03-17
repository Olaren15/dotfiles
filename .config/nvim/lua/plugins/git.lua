return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            numhl = true
        },
    },
    {
        "sindrets/diffview.nvim",
        keys = {
            { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "[g]it [d]iff view [o]pen"},
            { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "[g]it [d]iff view [c]lose"},
        }
    }
}
