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
vim.keymap.set("n", 'cr', vim.lsp.buf.rename)

-- Telescope
local builtin = require('telescope.builtin')
local default_opts = {noremap = true, silent = true}
vim.keymap.set('n', '<leader>f', ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set("n", '<leader>n', ":Telescope file_browser path=%:p:h hidden=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>g', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', default_opts)
vim.keymap.set('n', '<leader>c', builtin.git_status, { noremap = true, silent = true })

-- Harpoon
vim.keymap.set('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>m', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
