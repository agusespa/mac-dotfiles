require("conf.plugins")
require("conf.mappings")
require("conf.telescope")
require("conf.lsp")
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

require 'treesitter-context'.setup {
    enable = false,           -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
}
