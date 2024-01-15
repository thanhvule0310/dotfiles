return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
        "williamboman/mason.nvim",
        "b0o/schemastore.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")

        vim.fn.sign_define(
            "DiagnosticSignError",
            { text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" }
        )
        vim.fn.sign_define(
            "DiagnosticSignHint",
            { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" }
        )
        vim.fn.sign_define(
            "DiagnosticSignInfo",
            { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" }
        )
        vim.fn.sign_define(
            "DiagnosticSignWarn",
            { text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" }
        )

        vim.diagnostic.config({
            virtual_text = {
                source = false,
                prefix = "",
                format = function(diagnostic)
                    local sign = ""

                    if diagnostic.severity == vim.diagnostic.severity.ERROR then
                        sign = vim.fn.sign_getdefined("DiagnosticSignError")[1].text
                    elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                        sign = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text
                    elseif diagnostic.severity == vim.diagnostic.severity.INFO then
                        sign = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text
                    elseif diagnostic.severity == vim.diagnostic.severity.HINT then
                        sign = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text
                    end

                    return string.format("%s%s: %s ", sign, diagnostic.source or "", diagnostic.message)
                end,
            },
            float = {
                source = false,
                border = "single",
                header = false,
                format = function(diagnostic)
                    return string.format("%s: %s ", diagnostic.source or "", diagnostic.message)
                end,
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "single",
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "single",
        })

        require("lspconfig.ui.windows").default_options = {
            border = "single",
        }

        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Next Diagnostic" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
                vim.keymap.set(
                    "n",
                    "<leader>D",
                    vim.lsp.buf.type_definition,
                    { buffer = ev.buf, desc = "Show Type Definition" }
                )
                vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Actions" })
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Show hover" })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Goto Declaration" })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Goto Definition" })
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Goto Implementation" })

                vim.keymap.set("n", "<leader>li", function()
                    vim.lsp.inlay_hint(0, nil)
                end, { buffer = ev.buf, desc = "Toggle Inlay Hints" })
            end,
        })

        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        lspconfig.bashls.setup({
            capabilities = capabilities,
            cmd_env = {
                GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|.zsh)",
            },
            filetypes = { "sh", "zsh" },
        })

        lspconfig.cssls.setup({
            capabilities = capabilities,
        })

        lspconfig.docker_compose_language_service.setup({
            capabilities = capabilities,
        })

        lspconfig.dockerls.setup({
            capabilities = capabilities,
        })

        lspconfig.emmet_language_server.setup({
            capabilities = capabilities,
        })

        lspconfig.eslint.setup({
            capabilities = capabilities,
            root_dir = lspconfig.util.root_pattern(
                ".eslintrc",
                ".eslintrc.js",
                ".eslintrc.yml",
                ".eslintrc.json",
                "eslint.config.js",
                ".eslintrc.cjs",
                ".eslintrc.yaml"
            ),
        })

        lspconfig.golangci_lint_ls.setup({
            capabilities = capabilities,
        })

        lspconfig.gopls.setup({
            capabilities = capabilities,
            settings = {
                gopls = {
                    experimentalPostfixCompletions = true,
                    analyses = {
                        unusedparams = true,
                        shadow = true,
                    },
                    staticcheck = true,
                },
            },
            init_options = {
                usePlaceholders = true,
            },
        })

        lspconfig.graphql.setup({
            capabilities = capabilities,
        })

        lspconfig.html.setup({
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
            capabilities = capabilities,
        })

        lspconfig.jsonls.setup({
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
            init_options = {
                provideFormatter = false,
            },
            capabilities = capabilities,
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    format = { enable = false },
                    completion = { callSnippet = "Replace" },
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        })

        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
        })

        lspconfig.taplo.setup({
            capabilities = capabilities,
        })

        lspconfig.yamlls.setup({
            capabilities = capabilities,
            settings = {
                yaml = {
                    schemaStore = {
                        enable = false,
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
        })

        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            root_dir = lspconfig.util.root_pattern(
                "tailwind.config.js",
                "tailwind.config.cjs",
                "tailwind.config.mjs",
                "tailwind.config.ts",
                "postcss.config.js",
                "postcss.config.cjs",
                "postcss.config.mjs",
                "postcss.config.ts"
            ),
        })
    end,
}
