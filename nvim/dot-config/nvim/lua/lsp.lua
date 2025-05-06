vim.lsp.enable({
    "lua-language-server",
})

vim.lsp.config("*", {
  root_markers = { ".git" },
})

