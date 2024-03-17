return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        options = {
            theme = "dracula",
            component_separators = "|",
            section_separators = "",
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    icon = "",
                    padding = 2,
                },
            },
            lualine_b = {
                { "branch", padding = { left = 2, right = 1 } },
                "diff",
                { "diagnostics", padding = { left = 1, right = 2 } },
            },
            lualine_c = {
                {
                    "filename",
                    separator = {},
                    padding = { left = 2, right = 1 }
                },
                {
                    "filetype",
                    icon_only = true,
                    padding = { left = 0, right = 1 },
                },
            },
            lualine_x = {},
            lualine_y = {
                { "encoding", padding = { left = 2, right = 1 } },
                {
                    "fileformat",
                    symbols = {
                        unix = "LF",
                        dos = "CRLF",
                        mac = "CR",
                    },
                    padding = { left = 1, right = 2 },
                },
            },
            lualine_z = {
                "location",
                { "progress", padding = 2 },
            },
        },
        extensions = {
            "lazy",
            "neo-tree"
        }
    }
}
