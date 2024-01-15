return {
    "mrjones2014/smart-splits.nvim",
    keys = {
        {
            "<A-h>",
            function()
                require("smart-splits").move_cursor_left()
            end,
            desc = "Navigator Left",
        },
        {
            "<A-l>",
            function()
                require("smart-splits").move_cursor_right()
            end,
            desc = "Navigator Right",
        },
        {
            "<A-k>",
            function()
                require("smart-splits").move_cursor_up()
            end,
            desc = "Navigator Up",
        },
        {
            "<A-j>",
            function()
                require("smart-splits").move_cursor_down()
            end,
            desc = "Navigator Down",
        },
        {
            "<A-H>",
            function()
                require("smart-splits").resize_left()
            end,
            desc = "Resize Left",
        },
        {
            "<A-L>",
            function()
                require("smart-splits").resize_right()
            end,
            desc = "Resize Right",
        },
        {
            "<A-K>",
            function()
                require("smart-splits").resize_up()
            end,
            desc = "Resize Up",
        },
        {
            "<A-J>",
            function()
                require("smart-splits").resize_down()
            end,
            desc = "Resize Down",
        },
    },
    config = true,
}
