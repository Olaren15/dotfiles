return {
    {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<A-q>",
                function()
                    local bd = require("mini.bufremove").delete
                    if vim.bo.modified then
                        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()),
                            "&Yes\n&No\n&Cancel")
                        if choice == 1 then
                            vim.cmd.write()
                            bd(0)
                        elseif choice == 2 then
                            bd(0, true)
                        end
                    else
                        bd(0)
                    end
                end,
                desc = "[q]uit buffer",
            },
        },
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

            require("mini.bufremove").setup({})
        end
    }
}
