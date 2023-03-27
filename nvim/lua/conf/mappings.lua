vim.g.mapleader = '\''

vim.keymap.set("i", "kj", "<Esc>", { noremap = true })

vim.keymap.set("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", ":update<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", ":Explore<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
