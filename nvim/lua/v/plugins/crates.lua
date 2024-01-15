return {
    "saecki/crates.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufRead Cargo.toml",
    opts = {
        text = {
            loading = "  Loading ",
            version = "  %s ",
            prerelease = "  %s ",
            yanked = "  %s ",
            nomatch = "  No match ",
            upgrade = "  %s ",
            error = "  Error fetching crate ",
        },
    },
}
