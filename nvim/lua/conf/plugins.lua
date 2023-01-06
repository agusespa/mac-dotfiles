vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    -- -- LSP Configuration & Plugins
    -- use {
    --     'neovim/nvim-lspconfig',
    --     requires = {
    --       'williamboman/mason.nvim',
    --       'williamboman/mason-lspconfig.nvim',
    --       'j-hui/fidget.nvim',
    --       'folke/neodev.nvim',
    --     },
    -- }
    -- use { -- Autocompletion
    --     'hrsh7th/nvim-cmp',
    --     requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    -- }


    use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'j-hui/fidget.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    -- Snippet Collection (Optional)
    {'rafamadriz/friendly-snippets'},
  }
}

    -- General plugins
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    -- Utility plugins
    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
    use 'numToStr/Comment.nvim'
    use 'prettier/vim-prettier'
    use 'mbbill/undotree'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "nvim-telescope/telescope-file-browser.nvim"
    use 'ThePrimeagen/harpoon'

    -- Appearence plugins
    use "ellisonleao/gruvbox.nvim"
    use 'navarasu/onedark.nvim'

end)
