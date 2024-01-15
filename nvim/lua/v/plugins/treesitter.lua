return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        local MAX_FILE_LINES = 3000
        local MAX_FILE_SIZE = 100 * 1024 -- 100KB

        require("nvim-treesitter.configs").setup({
            autotag = {
                enable = true,
                enable_close_on_slash = false,
            },
            indent = {
                enable = true,
            },
            ensure_installed = "all",
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                max_file_lines = MAX_FILE_LINES,
                disable = function(_, bufnr)
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
                    if ok and stats and stats.size > MAX_FILE_SIZE then
                        return true
                    end
                end,
            },
            incremental_selection = { enable = false },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["ap"] = "@parameter.outer",
                        ["ip"] = "@parameter.inner",
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = { enable = false },
            },
            matchup = {
                enable = true,
            },
        })
    end,
}
