vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    -- LSP plugins
    use 'neovim/nvim-lspconfig'
    use {
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-cmdline'},
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
            {'rafamadriz/friendly-snippets'},
        }

    -- General plugins
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

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
    use 'numToStr/Comment.nvim'
    use 'prettier/vim-prettier'
    use 'rhysd/vim-clang-format'
    use 'tpope/vim-fugitive'
    use 'mbbill/undotree'
    use 'tpope/vim-sleuth'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "nvim-telescope/telescope-file-browser.nvim"
    use 'ThePrimeagen/harpoon'
    use 'fatih/vim-go'
    use 'vim-test/vim-test'
    use {
        "nvim-neotest/neotest",
        requires = {
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-vim-test"
        }
    }

    -- Appearence plugins
    use { "catppuccin/nvim", as = "catppuccin" }

end)
