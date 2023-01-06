require("telescope").load_extension("file_browser")
require("telescope").load_extension('harpoon')
require("telescope").setup {
    pickers = {
        buffers = {
          initial_mode = "normal"
        },
        lsp_references = {
          initial_mode = "normal"
        },
        diagnostics = {
          initial_mode = "normal"
        },
        find_files = {
        }
    },
    defaults = {
        layout_config = {
            width = 0.9,
            preview_width = 0.5,
        },
        path_display={"smart"},
        file_ignore_patterns = { "node_modules" }
    },
}

local builtin = require('telescope.builtin')
local default_opts = {noremap = true, silent = true}
vim.keymap.set('n', '<leader>f', ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set("n", '<leader>n', ":Telescope file_browser path=%:p:h hidden=true<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>g', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', default_opts)

-- harpoon
require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 40,
    }
})
vim.keymap.set('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>h', ':Telescope harpoon marks<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>m', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = "harpoon",
  callback = function()
    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'HarpoonBorder', { link = 'Normal' })
  end
})
