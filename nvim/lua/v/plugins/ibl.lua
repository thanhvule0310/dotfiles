return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
        indent = { char = "▏" },
        scope = {
            show_start = false,
            include = {
                node_type = {
                    lua = { "return_statement", "table_constructor" },
                    ["*"] = { "object", "arguments", "named_imports", "class_body" },
                },
            },
        },
    },
}
