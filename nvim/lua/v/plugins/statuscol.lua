return {
    "luukvbaal/statuscol.nvim",
    event = "VeryLazy",
    branch = "0.10",
    config = function()
        local builtin = require("statuscol.builtin")

        require("statuscol").setup({
            ft_ignore = { "neo-tree" },
            segments = {
                {
                    sign = { namespace = { "gitsigns" }, maxwidth = 1, colwidth = 1, auto = false },
                    click = "v:lua.ScSa",
                },
                { text = { " ", builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                {
                    sign = { name = { "Diagnostic" }, maxwidth = 1, auto = false },
                    click = "v:lua.ScSa",
                },
            },
        })
    end,
}
