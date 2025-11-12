require('mason').setup()

local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities(capabilities)
)

lspconfig.eslint.setup({})
lspconfig.stylelint_lsp.setup({
  filetypes = { "css", "less", "scss" }
})
lspconfig.cssls.setup({})
lspconfig.jsonls.setup({})
lspconfig.pyright.setup({})
lspconfig.html.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true
        }
      }
    }
  }
})
lspconfig.yamlls.setup({})
lspconfig.clangd.setup({
  filetypes = { "c", "cpp" },
})
-- lspconfig.omnisharp.setup({})
lspconfig.ts_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.golangci_lint_ls.setup({})
-- lspconfig.buf_ls.setup({})
-- lspconfig.kotlin_language_server.setup({})
-- lspconfig.angularls.setup({})
-- lspconfig.svelte.setup({})
lspconfig.bashls.setup({
  filetypes = { "sh" },
})
lspconfig.sqlls.setup({})
-- lspconfig.htmx.setup({})
-- lspconfig.templ.setup({})
lspconfig.lemminx.setup({
  settings = {
    xml = {
      format = {
        enabled = false,
        splitAttributes = false,
        joinCDATALines = false,
        joinCommentLines = false,
        formatComments = true,
        joinContentLines = false,
        spaceBeforeEmptyCloseTag = false
      }
    }
  }
})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  update_in_insert = false,
  float = {
    source = 'always',
    border = 'single',
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})

require("luasnip.loaders.from_vscode").lazy_load()
require 'luasnip'.filetype_extend("javascript", { "react" })

-- nvim-cmp
local cmp = require 'cmp'
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:CmpNormal",
    },
    documentation = {
      winhighlight = "Normal:CmpNormal",
    }
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- JAVA config
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local root_markers = { 'pom.xml', 'gradlew', 'mvnw' }
    local root_file = vim.fs.find(root_markers, { upward = true })[1]

    if not root_file then
      return -- Not in a Java project, don't start JDTLS
    end

    local root_dir = vim.fs.dirname(root_file)
    local project_name = vim.fn.fnamemodify(root_dir, ':t')
    local workspace_dir = "/Users/agusespa/.local/share/eclipse/" .. project_name

    local config = {
      cmd = {
        '/Users/agusespa/.local/share/nvim/mason/bin/jdtls',
        '-data', workspace_dir,
      },
      root_dir = root_dir,
    }

    require('jdtls').start_or_attach(config)
  end,
})
