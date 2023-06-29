vim.g.mapleader = '\''

vim.keymap.set("i", "kj", "<Esc>", { noremap = true })

vim.keymap.set("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", ":update<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", ":Explore<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>o", ":ClangFormat<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- LSPs
vim.keymap.set("n", '<leader>r', require('telescope.builtin').lsp_references)
vim.keymap.set('n', '<leader>d', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
vim.keymap.set("n", 'gd', vim.lsp.buf.definition)
vim.keymap.set("n", 'gt', vim.lsp.buf.type_definition)
vim.keymap.set("n", 'sd', vim.lsp.buf.hover)
vim.keymap.set('n', 'sf', vim.diagnostic.open_float)
vim.keymap.set("n", 'ca', vim.lsp.buf.code_action)
