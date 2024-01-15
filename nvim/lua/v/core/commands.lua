local _command = vim.api.nvim_create_user_command

_command("Wq", function()
    vim.cmd("wq")
end, {})

_command("Wqa", function()
    vim.cmd("wqa")
end, {})

_command("W", function()
    vim.cmd("w")
end, {})

_command("Q", function()
    vim.cmd("q")
end, {})
