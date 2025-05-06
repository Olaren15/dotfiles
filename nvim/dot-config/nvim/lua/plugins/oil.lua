
local config = function() 
    require("oil").setup({
        keymaps = {
            ["<Esc>"] = "actions.close"
        }
    })
    vim.keymap.set("n", "<leader>e", function() require("oil").open() end, { desc = "[e]xplore files" })
end


require("pckr").add({
    {
        "stevearc/oil.nvim",
        config = config,
    }
})

