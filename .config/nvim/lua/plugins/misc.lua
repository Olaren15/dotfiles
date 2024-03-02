return {
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "tpope/vim-surround",
    { "numToStr/Comment.nvim", opts = {} },
    {
        "echasnovski/mini.move",
        opts = {
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
        }
    },

}
