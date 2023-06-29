require("neotest").setup({
  adapters = {
    require("neotest-vim-test")
  }
})

-- vim.keymap.set('n', '<leader>t', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { noremap = true })
