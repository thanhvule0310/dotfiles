return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "sindrets/diffview.nvim",
    },
    config = true,
    cmd = "Neogit",
    keys = {
        {
            "<leader>gg",
            function()
                require("neogit").open()
            end,
            desc = "Open Neogit",
        },
    },
}
