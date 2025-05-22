return {
    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
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
