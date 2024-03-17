vim.o.guifont = "Fira Code:h13"
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_scroll_animation_length = 0.1

-- Scaling
vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1 / 1.25)
end)
