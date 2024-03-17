return {
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        init = function()
            vim.opt.timeout = true
            vim.opt.timeoutlen = 300
        end,
        config = function()
            require("which-key").setup()

            require("which-key").register({
                ["<leader>c"] = { name = "[c]ode", _ = "which_key_ignore" },
                ["<leader>d"] = { name = "[d]ocument", _ = "which_key_ignore" },
                ["<leader>r"] = { name = "[r]efactor", _ = "which_key_ignore" },
                ["<leader>s"] = { name = "[s]earch", _ = "which_key_ignore" },
                ["<leader>w"] = { name = "[w]okspace", _ = "which_key_ignore" },
                ["<leader>g"] = { name = "[g]it", _ = "which_key_ignore" },
                ["<leader>gd"] = { name = "[d]iff", _ = "which_key_ignore" },
            })
        end
    }
}
