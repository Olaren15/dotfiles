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
                }
            })

            vim.cmd.colorscheme("gruvbox")
        end
    }
}
