require("conf.plugins")
require("conf.mappings")
require("conf.telescope")
require("conf.lsp")
require("conf.lualine")
require("conf.bufferline")

vim.opt.termguicolors = true

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

vim.opt.smartindent = true

vim.opt.hlsearch = false

vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.incsearch = true

vim.opt.wrap = true
--  Indents word-wrapped lines as much as the 'parent' line
vim.opt.breakindent = true
--  Ensures word-wrap does not split words
vim.opt.formatoptions = l
vim.opt.lbr = true

vim.opt.signcolumn = 'yes'

vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }
vim.opt.spelloptions = "camel"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--  Appearence
require('onedark').setup {
    style = 'warm',
    transparent = true,
    highlights = {
        ColorColumn = { bg = "#1a1a1a" },
    }
}
require('onedark').load()

vim.cmd("colorscheme onedark")

require('Comment').setup()


-- require("gruvbox").setup({
--   undercurl = true,
--   underline = true,
--   bold = false,
--   italic = true,
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "", -- can be "hard", "soft" or empty string
--   palette_overrides = {},
--   overrides = {
--         -- SignColumn = { bg = "#282828" },
--         -- LineNr = { bg = "#1a1a1a" },
--         ColorColumn = { bg = "#1a1a1a" },
--   },
--   dim_inactive = false,
--   transparent_mode = true,
-- })
