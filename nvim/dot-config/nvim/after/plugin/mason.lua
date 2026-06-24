require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    -- dotnet
    "roslyn",

    -- java
    "jdtls",

    -- LaTeX
    "texlab",

    -- lua
    "lua-language-server",
    "stylua",

    -- markdown
    "markdownlint",

    -- nix
    "nil",
    "nixfmt",

    -- python
    "zuban",
    "black",

    -- rust
    "rust-analyzer",

    -- spelling
    "cspell",

    -- web
    "html-lsp",
    "css-lsp",
    "eslint-lsp",
    "json-lsp",
    "astro-language-server",
    "tailwindcss-language-server",
    "typescript-language-server",
    "prettierd",
    "prettier",

    -- yaml
    "yaml-language-server",
  },
  run_on_start = true,
  auto_update = true,
})
