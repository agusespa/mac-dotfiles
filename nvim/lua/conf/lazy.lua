-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- LSP plugins
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'mfussenegger/nvim-jdtls' },
        -- Autocompletion and Snippets
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-cmdline' },
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
        { 'saadparwaiz1/cmp_luasnip' },
        -- General plugins
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-tree/nvim-web-devicons' },
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
        -- Utility plugins
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
        },
        {
            'nvim-treesitter/nvim-treesitter-textobjects',
            dependencies = { 'nvim-treesitter/nvim-treesitter' }
        },
        { 'nvim-treesitter/nvim-treesitter-context' },
        { 'prettier/vim-prettier' },
        { 'psf/black' },
        { 'rhysd/vim-clang-format' },
        { 'tpope/vim-fugitive' },
        { 'tpope/vim-commentary' },
        { 'mbbill/undotree' },
        { 'preservim/tagbar' },
        { 'tpope/vim-sleuth' },
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' },
        },
        { 'nvim-telescope/telescope-file-browser.nvim' },
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
        },
        { 'fatih/vim-go' },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
