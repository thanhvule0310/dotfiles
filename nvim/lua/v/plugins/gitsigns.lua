return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = " " },
        },
        current_line_blame = true,
        current_line_blame_formatter = " <author>, <author_time:%Y-%m-%d> - <summary>",
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local _map = vim.keymap.set

            _map("n", "]g", function()
                if vim.wo.diff then
                    return "]g"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end, { buffer = bufnr, expr = true, desc = "󰊢 Next Hunk" })

            _map("n", "[g", function()
                if vim.wo.diff then
                    return "[g"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { buffer = bufnr, expr = true, desc = "󰊢 Previous Hunk" })

            _map("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
            _map("n", "<leader>gR", gs.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
            _map("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })
            _map("n", "<leader>gd", gs.diffthis, { buffer = bufnr, desc = "Diff This" })
            _map("n", "<leader>gt", gs.toggle_deleted, { buffer = bufnr, desc = "Toggle Deleted" })
        end,
    },
}
