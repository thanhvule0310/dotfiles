return {
    "williamboman/mason.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {
        ui = {
            width = 0.8,
            height = 0.8,
            icons = {
                package_installed = "",
                package_pending = "",
                package_uninstalled = "",
            },
        },
    },
    config = function(_, opts)
        require("mason").setup(opts)
        require("mason-tool-installer").setup({
            ensure_installed = {
                "bash-language-server",
                "css-lsp",
                "docker-compose-language-service",
                "dockerfile-language-server",
                "emmet-language-server",
                "eslint-lsp",
                "golangci-lint-langserver",
                "gopls",
                "graphql-language-service-cli",
                "html-lsp",
                "json-lsp",
                "lua-language-server",
                "rust-analyzer",
                "tailwindcss-language-server",
                "taplo",
                "typescript-language-server",
                "yaml-language-server",

                "actionlint",
                "alex",
                "golangci-lint",
                "hadolint",
                "shellcheck",
                "yamllint",

                "gofumpt",
                "goimports",
                "prettierd",
                "shfmt",
                "stylua",
            },
        })
    end,
}
