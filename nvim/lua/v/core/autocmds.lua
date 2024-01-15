local function _set_indent_size(size)
    vim.opt_local.shiftwidth = size
    vim.opt_local.tabstop = size
    vim.opt_local.softtabstop = size
end

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 300 })
    end,
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})

vim.api.nvim_create_autocmd("VimResized", {
    group = vim.api.nvim_create_augroup("ResizeSplit", { clear = true }),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitconfig", "cpp", "make", "c", "go", "lua", "rust", "fish", "yaml" },
    callback = function()
        _set_indent_size(4)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.opt_local.expandtab = false
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.cmd("startinsert!")
    end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_option_value(
            "formatoptions",
            (string.gsub(vim.api.nvim_get_option_value("formatoptions", { scope = "local" }), "[cro]", "")),
            { scope = "local" }
        )
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function(event)
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false

        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})
