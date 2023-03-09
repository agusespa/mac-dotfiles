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
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
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

require("indent_blankline").setup {
    use_treesitter = true,
    use_treesitter_scope = true,
    show_first_indent_level = false,
    show_trailing_blankline_indent = false
}
