-- Plug-ins
-- Packer
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    
    use 'wbthomason/packer.nvim'

    -- LSP Configuration & Plugins
    use { 
        'neovim/nvim-lspconfig',
        requires = {
          'williamboman/mason.nvim',
          'williamboman/mason-lspconfig.nvim',
          'j-hui/fidget.nvim',
          'folke/neodev.nvim',
        },
    }
    use { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
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

    -- Appearence plugins
    use "ellisonleao/gruvbox.nvim"

end)

require('Comment').setup()


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

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--  Appearence
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = false,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")

require("bufferline").setup{
  options = {
    numbers = "buffer_id",
    modified_icon = "+",
    diagnostics = "nvim_lsp",
    tab_size = 15,
    truncate_names = true,
    indicator = {
      style = 'none'
    },
    separator_style = "thin"
  },
        highlights = {
            fill = {
                bg = '#282828',
            },
            background = {
                bg = '#282828',
            },
            close_button = {
                bg = '#282828',
            },
            close_button_visible = {
                bg = '#282828',
            },
            close_button_selected = {
                bg = '#3c3836',
            },
            buffer_visible = {
                bg = '#282828'
            },
            buffer_selected = {
                bg = '#3c3836',
            },
            numbers = {
                bg = '#282828',
            },
            numbers_visible = {
                bg = '#282828',
            },
            numbers_selected = {
                bg = '#3c3836',
            },
            diagnostic = {
                bg = '#282828',
            },
            diagnostic_visible = {
                bg = '#282828',
            },
            diagnostic_selected = {
                bg = '#3c3836',
            },
            warning = {
                bg = '#282828',
            },
            warning_visible = {
                bg = '#282828',
            },
            warning_selected = {
                bg = '#3c3836',
            },
            error = {
                bg = '#282828',
            },
            error_visible = {
                bg = '#282828',
            },
            error_selected = {
                bg = '#3c3836',
            },
            hint_diagnostic = {
                bg = '#282828',
            },
            hint_diagnostic_visible = {
                bg = '#282828',
            },
            hint_diagnostic_selected = {
                bg = '#3c3836',
            },
            hint = {
                bg = '#282828',
            },
            hint_visible = {
                bg = '#282828',
            },
            hint_selected = {
                bg = '#3c3836',
            },
            info = {
                bg = '#282828',
            },
            info_visible = {
                bg = '#282828',
            },
            info_selected = {
                bg = '#3c3836',
            },
            separator_selected = {
                bg = '#3c3836',
            },
            separator_visible = {
                bg = '#282828',
            },
            separator = {
                bg = '#282828',
            },
            indicator_selected = {
                bg = '#665c54',
            },
            modified = {
                bg = '#282828',
            },
            modified_visible = {
                bg = '#282828',
            },
            modified_selected = {
                bg = '#3c3836',
            },
        }
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    section_separators = '',
    component_separators = '',
    theme = 'gruvbox',
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
        {
          'filename',
          file_status = true,      -- Displays file status (readonly status, modified status)
          newfile_status = false,   -- Display new file status (new file means no write after created)
          path = 1,                -- 0: Just the filename
                                   -- 1: Relative path
                                   -- 2: Absolute path
                                   -- 3: Absolute path, with tilde as the home directory

          shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                   -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]',     -- Text to show for new created file before first writting
          }
        }
    },
    lualine_c = {'branch', 'diff'},
    lualine_x = {'encoding'},
    lualine_y = {'filetype'},
    lualine_z = {
        'progress', 'location',
        {
          'diagnostics',
          sections = { 'error', 'warn', 'info', 'hint' },
          diagnostics_color = {
            error = 'DiagnosticError', -- Changes diagnostics' error color.
            warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
            info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
            hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
          },
          symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
          colored = true,           -- Displays diagnostics status in color if set to true.
          update_in_insert = false, -- Update diagnostics in insert mode.
          always_visible = false,   -- Show diagnostics even if there are none.
        }
      }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require("telescope").load_extension "file_browser"

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}


-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'lua', 'python', 'java', 'typescript', 'tsx', 'css', 'html', 'scss', 'javascript', 'json', 'help' },
}


-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

--  Mappings
-- 
vim.g.mapleader = ';'
--  esc in insert & visual mode
local options = { noremap = true }
vim.keymap.set("i", "kj", "<Esc>", options)
--  delete buffer without closing window

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin. buffers, {})
vim.keymap.set("n", "<leader>n", ":Telescope file_browser<CR>", { silent = true })

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

--  delete current buffer
vim.keymap.set("n", "<leader>q", ":bd<CR>")

--vim.g["prettier#autoformat"] = 1
--vim.g["rettier#autoformat_require_pragma"] = 0
