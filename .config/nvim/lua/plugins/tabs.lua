return {
    {
        "akinsho/bufferline.nvim",
        keys = {
            { "<A-n>", "<cmd>BufferLineCycleNext<cr>", desc = "[n]ext buffer" },
            { "<A-p>", "<cmd>BufferLineCyclePrev<cr>", desc = "[p]revious buffer" },
        },
        event = "VeryLazy",
        opts = {
            options = {
                close_command = function(n) require("mini.bufremove").delete(n, false) end,
                right_mouse_comman = function(n) require("mini.bufremove").delete(n, false) end,
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    }
                }
            }
        },
    },
}
