return {
    {
        "stevearc/oil.nvim",
        opts = {
            keymaps = {
                ["<Esc>"] = "actions.close"
            }
        },
        keys = {
            { "<leader>e", function() require("oil").open() end, desc = "[e]xplore files" }
        },
        lazy = false
    }
}
