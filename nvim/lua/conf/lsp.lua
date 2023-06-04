local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.setup_nvim_cmp({
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    }
})

lsp.configure('stylelint', {
    filetypes = { "css", "scss" },
})

lsp.setup()

vim.keymap.set("n", 'ca', vim.lsp.buf.code_action, { buffer = bufnr })
vim.keymap.set("n", 'gd', vim.lsp.buf.definition, { buffer = bufnr })
vim.keymap.set("n", '<leader>r', require('telescope.builtin').lsp_references, { buffer = bufnr })
vim.keymap.set("n", '<leader>t', vim.lsp.buf.type_definition, { buffer = bufnr })
vim.keymap.set('n', '<leader>d', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
vim.keymap.set("n", 'gI', vim.lsp.buf.implementation, { buffer = bufnr })
vim.keymap.set("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { buffer = bufnr })
vim.keymap.set("n", 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'python', 'java', 'typescript', 'tsx', 'css', 'html', 'scss', 'javascript', 'json', 'help' },
}

require('fidget').setup()

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  update_in_insert = false,
  float = {
    source = 'always'
  },
})
