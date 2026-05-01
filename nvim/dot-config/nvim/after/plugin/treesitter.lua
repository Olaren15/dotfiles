local ts = require("nvim-treesitter")

local stable = ts.get_available(1)
local unstable = ts.get_available(2)
local available = {}

for _, v in ipairs(stable) do
  table.insert(available, v)
end

for _, v in ipairs(unstable) do
  table.insert(available, v)
end

local already_installed = ts.get_installed()
local to_install = vim
  .iter(available)
  :filter(function(parser)
    return not vim.tbl_contains(already_installed, parser)
  end)
  :totable()

ts.install(to_install)
ts.update()

require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  },
})

require("nvim-treesitter-textobjects").setup({
  select = {
    enable = true,
    lookahead = true,
  },
})
