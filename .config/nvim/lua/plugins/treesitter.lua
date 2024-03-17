return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
            "andymass/vim-matchup",
        },
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "vimdoc", "vim" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                },
                autotag = {
                    enable = true,
                },
                matchup = {
                    enable = true,
                },
                sync_install = false,
                ignore_install = {},
                modules = {},
            })
        end,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        dependencies = {
            "numToStr/Comment.nvim",
        },
        event = "VeryLazy",
        config = function ()
            ---@diagnostic disable-next-line: missing-fields
            require("ts_context_commentstring").setup({
                enable_autocmd = false,
            })

            ---@diagnostic disable-next-line: missing-fields
            require("Comment").setup({
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            })
        end,
    },
}
