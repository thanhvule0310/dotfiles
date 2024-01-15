return {
    "nvim-telescope/telescope.nvim",
    version = false,
    cmd = { "Telescope" },
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files({
                    hidden = true,
                    no_ignore = true,
                })
            end,
            desc = "Find File",
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep({
                    prompt_prefix = "     ",
                })
            end,
            desc = "Find File by grep",
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers({
                    prompt_prefix = "     ",
                })
            end,
            desc = "Find buffers",
        },
        {
            "<leader>fd",
            function()
                require("telescope.builtin").diagnostics({
                    prompt_prefix = "     ",
                })
            end,
            desc = "Diagnostics",
        },
        {
            "<leader>gs",
            function()
                require("telescope.builtin").git_status({
                    prompt_prefix = "     ",
                })
            end,
            desc = "Status",
        },
        {
            "<leader>gc",
            function()
                require("telescope.builtin").git_commits({
                    prompt_prefix = "    ",
                })
            end,
            desc = "Commits",
        },
        {
            "<leader>gb",
            function()
                require("telescope.builtin").git_branches({
                    prompt_prefix = "    ",
                })
            end,
            desc = "Branches",
        },
        {
            "gr",
            function()
                require("telescope.builtin").lsp_references({
                    prompt_prefix = "     ",
                })
            end,
            desc = "Open references",
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            picker = {
                hidden = false,
            },
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--no-ignore",
                    "--smart-case",
                    "--hidden",
                },
                prompt_prefix = "     ",
                selection_caret = " ",
                entry_prefix = " ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.5 },
                    vertical = { mirror = false },
                    width = 0.8,
                },
                file_sorter = require("telescope.sorters").get_fuzzy_file,
                file_ignore_patterns = { "node_modules/", ".git/", "dist/", "build/", "target/", "^.obsidian/" },
                generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                path_display = { "absolute" },
                winblend = 0,
                border = {},
                borderchars = { "" },
                color_devicons = true,
                use_less = true,
                set_env = { ["COLORTERM"] = "truecolor" },
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                mappings = {
                    i = {
                        ["<Down>"] = "move_selection_next",
                        ["<Up>"] = "move_selection_previous",

                        ["<Tab>"] = "move_selection_next",
                        ["<S-Tab>"] = "move_selection_previous",
                    },
                    n = {
                        ["<Down>"] = "move_selection_next",
                        ["<Up>"] = "move_selection_previous",

                        ["<Tab>"] = "move_selection_next",
                        ["<S-Tab>"] = "move_selection_previous",
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        telescope.load_extension("fzf")
    end,
}
