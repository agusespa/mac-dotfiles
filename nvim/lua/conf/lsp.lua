require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities(capabilities)
)

lspconfig.tsserver.setup({})

-- Angular setup
local uv = vim.loop
local util = require "lspconfig.util"
local function get_node_modules(root_dir)
  local root_node = root_dir .. "/node_modules"
  local stats = uv.fs_stat(root_node)
  if stats == nil then
    return ''
  else
    return root_node
  end
end
local default_node_modules = get_node_modules(vim.fn.getcwd())
local ngls_cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  default_node_modules,
  "--ngProbeLocations",
  default_node_modules,
  "--includeCompletionsWithSnippetText",
  "--includeAutomaticOptionalChainCompletions",
}
lspconfig.angularls.setup {
  filetypes = { "typescript", "html" },
  cmd = ngls_cmd,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("angular.json"),
  on_new_config = function(new_config)
    new_config.cmd = ngls_cmd
  end
}
-- END of Angular setup

lspconfig.eslint.setup({})
lspconfig.stylelint_lsp.setup({
  filetypes = { "css", "less", "scss" }
})
lspconfig.cssls.setup({})
lspconfig.jsonls.setup({})
lspconfig.pyright.setup({})
lspconfig.html.setup({})
lspconfig.lua_ls.setup({})
lspconfig.yamlls.setup({})


require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'python', 'java', 'typescript', 'tsx', 'css', 'html', 'scss', 'javascript', 'json', 'vimdoc' },
}

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  update_in_insert = false,
  float = {
    source = 'always'
  },
})

-- nvim-cmp
local cmp = require'cmp'
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
      end,
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
