vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- LSP plugins
    use 'neovim/nvim-lspconfig'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }
    use {
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-cmdline' },
        -- { 'codota/tabnine-nvim',         run = "./dl_binaries.sh" },
        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
        { 'saadparwaiz1/cmp_luasnip' },
    }

    -- General plugins
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use "nvim-lua/plenary.nvim"
    -- use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    -- Utility plugins
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
    use "lukas-reineke/indent-blankline.nvim"
    use 'prettier/vim-prettier'
    use 'psf/black'
    use 'rhysd/vim-clang-format'
    use 'dart-lang/dart-vim-plugin'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'mbbill/undotree'
    use 'preservim/tagbar'
    use 'tpope/vim-sleuth'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use "nvim-telescope/telescope-file-browser.nvim"
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use 'fatih/vim-go'
    use 'vim-test/vim-test'

    -- Appearence plugins
    use { "catppuccin/nvim", as = "catppuccin" }
end)
