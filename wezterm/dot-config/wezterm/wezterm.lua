local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Gruvbox dark, medium (base16)"

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

--- @diagnostic disable-next-line: unused-local
wezterm.on("update-status", function(window, pane)
  local name = window:active_key_table()
  window:set_right_status(name or "")
end)

config.disable_default_key_bindings = true
config.leader = { key = " ", mods = "ALT", timeout_milliseconds = 1003 }
config.keys = {
  -- Splits
  { key = "v", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "b", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  -- Resize mode
  {
    key = "r",
    mods = "LEADER",
    action = wezterm.action.ActivateKeyTable({ name = "resize_mode", one_shot = false }),
  },
  -- Yank & Paste
  { key = "y", mods = "LEADER", action = wezterm.action.CopyTo("Clipboard") },
  { key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
  { key = "p", mods = "LEADER", action = wezterm.action.PasteFrom("Clipboard") },
  { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
  -- Search/Copy mode
  { key = "s", mods = "LEADER", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },
  { key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
  -- Focus tabs
  { key = "1", mods = "ALT", action = wezterm.action.ActivateTab(1) },
  { key = "2", mods = "ALT", action = wezterm.action.ActivateTab(2) },
  { key = "3", mods = "ALT", action = wezterm.action.ActivateTab(3) },
  { key = "4", mods = "ALT", action = wezterm.action.ActivateTab(4) },
  { key = "5", mods = "ALT", action = wezterm.action.ActivateTab(5) },
  { key = "6", mods = "ALT", action = wezterm.action.ActivateTab(6) },
  { key = "7", mods = "ALT", action = wezterm.action.ActivateTab(7) },
  { key = "8", mods = "ALT", action = wezterm.action.ActivateTab(8) },
  { key = "9", mods = "ALT", action = wezterm.action.ActivateTab(9) },
  { key = "0", mods = "ALT", action = wezterm.action.ActivateTab(10) },
  -- Send "ALT-space" to the terminal when pressing ALT-space, ALT-space
  { key = " ", mods = "ALT", action = wezterm.action.SendKey({ key = " ", mods = "ALT" }) },
}

config.key_tables = {
  resize_mode = {
    { key = "-", action = wezterm.action.DecreaseFontSize },
    { key = "=", action = wezterm.action.IncreaseFontSize },
    { key = "0", action = wezterm.action.ResetFontSize },
    { key = "Escape", action = "PopKeyTable" },
  },
}
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config, {
  modifiers = {
    move = "CTRL",
    resize = "CTRL|SHIFT",
  },
})

return config
