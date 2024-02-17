-- Use vim config
vim.cmd("source ~/.vimrc")

vim.o.termguicolors = true
vim.wo.signcolumn = 'yes'
vim.o.undofile = true

-- Lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
    {
        "dracula/vim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme dracula")
        end,
    },
    'tpope/vim-sleuth',
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
            'folke/neodev.nvim',
        },
    },
})

-- [[ Configura LSP ]]
local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', function()
        vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
    end, '[C]ode [A]ction')
    nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
    nmap('gd', vim.lsp.buf.lsp_definitions, '[g]oto [d]efinition')
    nmap('gr', vim.lsp.buf.lsp_references, '[g]oto [r]eferences')
    nmap('gI', vim.lsp.buf.lsp_implementations, '[g]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', vim.lsp.buf.lsp_document_symbols, '[d]ocument [s]ymbols')
    nmap('<leader>ws', vim.lsp.buf.lsp_dynamic_workspace_symbols, '[w]orkspace [w]ymbols')
    nmap('<leader>f', function()
        vim.lsp.buf.format { async = true }
    end, '[f]ormat')
end

require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
    rust_analyzer = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        }
    }
}

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()

require('mason-lspconfig').setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes
        }
    end,
}
