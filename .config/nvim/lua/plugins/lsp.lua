return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            "j-hui/fidget.nvim",
            opts = {},
        },
        "folke/neodev.nvim",
        "RRethy/vim-illuminate",
        -- "hrsh7th/cmp-nvim-lsp",  TODO
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls"
            },
            automatic_installaion = true,
        })

        require("neodev").setup()

        -- This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(client, bufnr)
            local lsp_map = function(keys, func, description)
                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = description })
            end

            lsp_map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
            lsp_map("<leader>ca", function()
                vim.lsp.buf.code_action { context = { only = { "quickfix", "refactor", "source" } } }
            end, "[C]ode [A]ction")
            lsp_map("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
            lsp_map("gd", vim.lsp.buf.lsp_definitions, "[g]oto [d]efinition")
            lsp_map("gr", vim.lsp.buf.lsp_references, "[g]oto [r]eferences")
            lsp_map("gI", vim.lsp.buf.lsp_implementations, "[g]oto [I]mplementation")
            lsp_map("<leader>D", vim.lsp.buf.lsp_type_definitions, "Type [D]efinition")
            lsp_map("<leader>ds", vim.lsp.buf.lsp_document_symbols, "[d]ocument [s]ymbols")
            lsp_map("<leader>ws", vim.lsp.buf.lsp_dynamic_workspace_symbols, "[w]orkspace [w]ymbols")
            lsp_map("<leader>rf", function()
                vim.lsp.buf.format { async = true }
            end, "[r]e-[f]ormat")

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                vim.lsp.buf.format()
            end, { desc = "Format current buffer with LSP" })

            lsp_map("<leader>ff", "<cmd>Format<cr>", "Format")

            -- Attach and configure vim-illuminate
            require("illuminate").on_attach(client)
        end


        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local lsp_servers = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                }
            }
        }

        require("mason-lspconfig").setup_handlers {
            function(server_name)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = lsp_servers[server_name],
                    filetypes = (lsp_servers[server_name] or {}).filetypes
                }
            end
        }
    end
}
