return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "angularls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "gh_actions_ls",
        "gradle_ls",
        "html",
        "jdtls",
        "jsonls",
        "markdown_oxide",
        "markdownlint",
        "nixfmt",
        "rust_analyzer",
        "sqlls",
        "tailwindcss",
        "texlab",
        "ts_ls",
        "yamlls",
      },
    },
  },
}
