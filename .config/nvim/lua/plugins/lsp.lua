return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim",       opts = {} },
            "hrsh7th/cmp-nvim-lsp",
            "folke/neodev.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("neodev").setup()

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("my-lsp-attach", { clear = true }),
                callback = function(event)
                    local lsp_map = function(keys, func, description)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " ..description })
                    end

                    lsp_map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    lsp_map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    lsp_map("gd", require("telescope.builtin").lsp_definitions, "[g]oto [d]efinition")
                    lsp_map("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")
                    lsp_map("gI", require("telescope.builtin").lsp_implementations, "[g]oto [I]mplementation")
                    lsp_map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                    lsp_map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")
                    lsp_map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[w]orkspace [w]ymbols")
                    lsp_map("<leader>rf", function()
                        vim.lsp.buf.format { async = true }
                    end, "[r]e-[f]ormat")
                end
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            local lsp_servers = {
                lua_ls = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    }
                }
            }

            require("mason").setup()

            local ensure_installed = vim.tbl_keys(lsp_servers or {})
            vim.list_extend(ensure_installed, {
                "stylua"
            })

            require("mason-tool-installer").setup({
                ensure_installed = ensure_installed,
                auto_update = true,
            })

            require("mason-lspconfig").setup({
                automatic_installaion = true,
                handlers = {
                    function(server_name)
                        local server = lsp_servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end
                }
            })
        end,
    },
    { "folke/neodev.nvim", opts = {}, event = "VeryLazy" },
}
