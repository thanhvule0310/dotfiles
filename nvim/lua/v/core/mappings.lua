vim.keymap.set("n", "<leader>bk", "<CMD>bd<CR>", { desc = "Kill current buffer" })
vim.keymap.set("n", "<leader>bK", "<CMD>%bd|e#|bd#<CR>", { desc = "Kill other buffers" })
vim.keymap.set("n", "[b", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<CMD>bnext<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "<leader>n", "<CMD>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "[t", "<CMD>tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "]t", "<CMD>tabnext<CR>", { desc = "Next tab" })

vim.keymap.set("n", "<leader>qo", "<CMD>copen<CR>", { desc = "QuickFix open" })
vim.keymap.set("n", "<leader>qc", "<CMD>cclose<CR>", { desc = "QuickFix close" })
vim.keymap.set("n", "]q", "<CMD>cnext<CR>", { desc = "QuickFix next" })
vim.keymap.set("n", "[q", "<CMD>cprevious<CR>", { desc = "QuickFix previous" })
