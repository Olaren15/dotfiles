vim.opt.termguicolors = true

vim.opt.undofile = true

-- Shown in lualine
vim.opt.showmode = false
vim.opt.showcmd = false

-- Indenting
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- Scrolling
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5
vim.opt.wrap = false

-- Splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Displaying whitespace
vim.opt.list = true
vim.opt.listchars = { tab = ">-", space = "·", nbsp = "␣" }

vim.opt.colorcolumn = { [1] = 80, [2] = 120 }
