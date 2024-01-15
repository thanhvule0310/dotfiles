return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.register({
            ["<leader>f"] = { name = "[Telescope]" },
            ["<leader>g"] = { name = "[Git]" },
            ["<leader>l"] = { name = "[LSP]" },
            ["<leader>b"] = { name = "[Buffer]" },
            ["<leader>lt"] = { name = "[Typescript]" },
            ["<leader>q"] = { name = "[QuickFix]" },
            ["<leader>a"] = { name = "[AI]" },
        }, {
            mode = "n",
            prefix = "",
            silent = true,
            noremap = true,
            nowait = true,
        })

        wk.setup({
            icons = {
                breadcrumb = "󰫍 ",
                separator = " ",
                group = "+ ",
            },
            key_labels = {
                ["<space>"] = "SPACE",
                ["<leader>"] = "SPACE",
                ["<cr>"] = "RETURN",
                ["<tab>"] = "TAB",
            },
        })
    end,
}
