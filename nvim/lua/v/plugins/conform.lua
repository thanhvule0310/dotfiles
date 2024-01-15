return {
    "stevearc/conform.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
        "williamboman/mason.nvim",
    },
    keys = {
        {
            "<leader>lf",
            function()
                require("conform").format()
            end,
            desc = "Format current buffer",
        },
    },
    opts = {
        format = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
        },
        formatters_by_ft = {
            ["markdown.mdx"] = { "prettierd" },
            bash = { "shfmt" },
            css = { "prettierd" },
            fish = { "fish_indent" },
            go = { "goimports", "gofumpt" },
            graphql = { "prettierd" },
            html = { "prettierd" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            json = { "prettierd" },
            jsonc = { "prettierd" },
            less = { "prettierd" },
            lua = { "stylua" },
            markdown = { "prettierd" },
            sass = { "prettierd" },
            scss = { "prettierd" },
            sh = { "shfmt" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            vue = { "prettierd" },
            yaml = { "prettierd" },
            zsh = { "shfmt" },
        },
        formatters = {
            injected = { options = { ignore_errors = true } },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        format_after_save = {
            lsp_fallback = true,
        },
    },
}
