return {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
        filetypes = { "*", "!prompt", "!popup" },
        user_default_options = {
            RGB = true,
            RRGGBB = true,
            names = false,
            RRGGBBAA = true,
            AARRGGBB = false,
            rgb_fn = true,
            hsl_fn = true,
            css = false,
            css_fn = false,
            mode = "background",
            tailwind = true,
        },
        buftypes = {},
    },
}
