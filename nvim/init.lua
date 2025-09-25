require("conf.lazy")

require("conf.mappings")
require("conf.utils")
require("conf.lsp")
require("conf.snippets")
require("conf.statusline")

vim.opt.termguicolors = true

vim.cmd("language en_US")

vim.opt.textwidth = 0
vim.opt.ruler = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "79"
vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 750

vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.splitright = true

vim.opt.smartindent = true

vim.opt.hlsearch = false

vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.incsearch = true

vim.opt.wrap = true
--  Indents word-wrapped lines as much as the 'parent' line
vim.opt.breakindent = true
vim.opt.lbr = true

vim.opt.formatoptions = vim.opt.formatoptions
    - "a" -- Disable auto-formatting (let LSP handle it)
    - "t" -- Disable text wrapping (let LSP/editor handle soft-wrapping)
    + "c" -- Wrap comments (respects 'textwidth' in comments)
    + "q" -- Allow formatting comments with `gq`
    + "j" -- Remove comment leaders when joining lines
    + "n" -- Recognize numbered lists
    + "b" -- Break only at whitespace (prevents mid-word splits)

vim.opt.signcolumn = 'yes'

vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }
vim.opt.spelloptions = "camel"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.background = "dark"
require('conf.colorscheme').setup()
