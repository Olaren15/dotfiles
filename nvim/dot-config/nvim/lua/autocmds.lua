vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", {}),
    callback = function(event)
        -- lsp specific keymaps
        local bufmap = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = "LSP: " .. desc, })
        end

        bufmap("n", "<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
        bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ctions")
        bufmap("n", "gd", vim.lsp.buf.definition, "[g]o to [d]efinition")
        bufmap("n", "gi", vim.lsp.buf.implementation, "[g]o to [i]mplementation")
        bufmap("n", "gr", vim.lsp.buf.references, "[g]o to [r]eferences")
        bufmap("n", "gD", vim.lsp.buf.declaration, "[g]o to [D]eclaration")
        bufmap("n", "gt", vim.lsp.buf.type_definition, "[g]o to [t]ype definition")

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Auto highligh word under cursor
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local hl_group = vim.api.nvim_create_augroup('current-var-lsp-hl', { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = hl_group,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = hl_group,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(detach_event)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "current-var-lsp-hl", buffer = detach_event.buf })
                end
            })
        end

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            bufmap("n", "<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "[t]oggle inlay [h]ints")
        end
    end
})
