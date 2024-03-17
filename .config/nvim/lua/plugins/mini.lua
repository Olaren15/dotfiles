return {
    {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        config = function()
            require("mini.ai").setup({ n_lines = 500 })
            require("mini.pairs").setup({})
            require("mini.move").setup({
                mappings = {
                    left = "<C-h>",
                    right = "<C-l>",
                    down = "<C-j>",
                    up = "<C-k>",

                    line_left = "<C-h>",
                    line_right = "<C-l>",
                    line_down = "<C-j>",
                    line_up = "<C-k>",
                }
            })
        end
    }
}