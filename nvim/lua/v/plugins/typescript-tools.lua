return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    event = "VeryLazy",
    keys = {
        { "<leader>ltg", "<CMD>TSToolsGoToSourceDefinition<CR>", desc = "󱌎 Goto Source Definition" },
        { "<leader>lto", "<CMD>TSToolsOrganizeImports<CR>", desc = "󱎅 Organize Imports" },
        { "<leader>lts", "<CMD>TSToolsSortImports<CR>", desc = "󰒿 Sort Imports" },
        { "<leader>ltr", "<CMD>TSToolsRemoveUnusedImports<CR>", desc = "󰩺 Remove Unused Imports" },
        { "<leader>lta", "<CMD>TSToolsAddMissingImports<CR>", desc = "󰋺 Add Missing Imports" },
        { "<leader>ltf", "<CMD>TSToolsFixAll<CR>", desc = "󰁨 Fix All" },
    },
    opts = {
        on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end,
        settings = {
            tsserver_plugins = {
                "@styled/typescript-styled-plugin",
            },
            tsserver_file_preferences = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
}
