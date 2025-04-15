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
        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
        { 'saadparwaiz1/cmp_luasnip' },
    }

    -- General plugins
    use "nvim-lua/plenary.nvim"
    use "nvim-tree/nvim-web-devicons"

    -- Utility plugins
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'prettier/vim-prettier'
    use 'psf/black'
    use 'rhysd/vim-clang-format'
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
    }
    use 'fatih/vim-go'
    use 'vim-test/vim-test'
    use 'tjdevries/express_line.nvim'
end)
