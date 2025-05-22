return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        opts = {
            signs = {
                add          = { text = '▐' },
                change       = { text = '▐' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged = {
                add          = { text = '▐' },
                change       = { text = '▐' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            attach_to_untracked = true,
            current_line_blame = true,
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function bufmap(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, })
                end

                bufmap("n", "]h", function()
                    if vim.wo.diff then
                        -- Go to next diff if in vimdiff
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, "go to next [h]unk")

                bufmap("n", "[h", function()
                    if vim.wo.diff then
                        -- Go to previous diff if in vimdiff
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, "go to previous [h]unk")

                bufmap("n", "gh", gitsigns.preview_hunk, "[g]it preview [h]unk")
                bufmap("n", "<leader>gb", gitsigns.blame, "[g]it [b]lame")
                bufmap("n", "<leader>gd", gitsigns.diffthis, "[g]it [d]iff")
            end
        }
    }
}
