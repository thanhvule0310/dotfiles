return {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        vim.g.skip_ts_context_commentstring_module = true

        require("Comment").setup({
            padding = true,
            sticky = true,
            toggler = { line = "gcc", block = "gbc" },
            opleader = { line = "gc", block = "gb" },
            mappings = { basic = true, extra = true, extended = false },
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })
    end,
}
