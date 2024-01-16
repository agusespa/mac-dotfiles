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
require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    show_end_of_buffer = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false,
    no_bold = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        harpoon = true,
        treesitter = true,
    },
})

vim.cmd("colorscheme catppuccin")

require('Comment').setup()

require("ibl").setup{
    scope = { enabled = false },
}

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
}
