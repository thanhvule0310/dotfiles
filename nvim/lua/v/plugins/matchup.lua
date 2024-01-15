return {
    "andymass/vim-matchup",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
        vim.g.matchup_matchparen_offscreen = {}
    end,
}
