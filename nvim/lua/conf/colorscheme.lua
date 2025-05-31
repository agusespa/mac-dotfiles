local M = {}

M.colors = {
  bg        = "#000000",
  bg_light  = "#1e2030",
  bg_slate  = "#2c323c",
  red       = "#d22d3a",
  green     = "#98c379",
  yellow    = "#e6b800",
  gray      = "#5c6370",

  -- semantic groups
  text      = "#e2e4e9",
  literals  = "#8fbf9f",
  numbers  = "#d99e8f",
  hints     = "#5a9b9f",
  types     = "#9a8dbb",
  operators = "#e499e6",
  constants = "#e16ba8",
}

function M.setup()
  -- Syntax
  -- Default text
  vim.api.nvim_set_hl(0, "Normal", { fg = M.colors.text, bg = M.colors.bg })
  vim.api.nvim_set_hl(0, "Identifier", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "Delimiter", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@variable", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@variable.parameter", { link = "@variable", italic = true })
  vim.api.nvim_set_hl(0, "@variable.member", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@punctuation", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "@punctuation" })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "@punctuation" })
  vim.api.nvim_set_hl(0, "@punctuation.special", { link = "@punctuation" })
  vim.api.nvim_set_hl(0, "@field", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@property", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@symbol", { link = "@variable" })

  -- Secondary text
  vim.api.nvim_set_hl(0, "Comment", { fg = M.colors.gray, italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = M.colors.gray, italic = true })
  vim.api.nvim_set_hl(0, "Whitespace", { fg = M.colors.gray })
  vim.api.nvim_set_hl(0, "NonText", { fg = M.colors.gray })
  vim.api.nvim_set_hl(0, "Conceal", { fg = M.colors.gray })
  vim.api.nvim_set_hl(0, "Ignore", { fg = M.colors.gray })

  -- Keywords & control flow
  vim.api.nvim_set_hl(0, "Statement", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "Keyword", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "Conditional", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "Repeat", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@repeat", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "Exception", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "Operator", { fg = M.colors.operators })
  vim.api.nvim_set_hl(0, "@keyword", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@keyword.operator", { link = "Operator" })
  vim.api.nvim_set_hl(0, "@keyword.function", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@keyword.return", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@conditional", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@exception", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "Include", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@include", { link = "Include" })
  vim.api.nvim_set_hl(0, "Label", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@attribute", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@attribute.builtin", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@annotation", { link = "@attribute" })
  vim.api.nvim_set_hl(0, "@decorator", { link = "@attribute" })

  -- Functions
  vim.api.nvim_set_hl(0, "Function", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@function", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@function.call", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@function.builtin", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@function.macro", { link = "@function" })
  vim.api.nvim_set_hl(0, "@function.method", { link = "@function" })
  vim.api.nvim_set_hl(0, "@method", { link = "@function" })
  vim.api.nvim_set_hl(0, "@method.call", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@constructor", { fg = M.colors.text })

  -- Types
  vim.api.nvim_set_hl(0, "Type", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@type", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@type.builtin", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@type.definition", { link = "@type" })
  vim.api.nvim_set_hl(0, "@type.qualifier", { link = "@type" })
  vim.api.nvim_set_hl(0, "@typeParameter", { link = "@type" })
  vim.api.nvim_set_hl(0, "@namespace", { link = "@type" })
  vim.api.nvim_set_hl(0, "@namespace.builtin", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "Structure", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@structure", { link = "Structure" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "Macro", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@macro", { link = "Macro" })
  vim.api.nvim_set_hl(0, "Define", { link = "Macro" })
  vim.api.nvim_set_hl(0, "@class", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@class.builtin", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@interface", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@struct", { link = "@class" })
  vim.api.nvim_set_hl(0, "@trait", { link = "@class" })
  vim.api.nvim_set_hl(0, "@enum", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "@module", { fg = M.colors.text })

  -- Constants
  vim.api.nvim_set_hl(0, "@constant", { fg = M.colors.constants })
  vim.api.nvim_set_hl(0, "Constant", { link = "@constant" })
  vim.api.nvim_set_hl(0, "@enumMember", { link = "@constant" })
  vim.api.nvim_set_hl(0, "@constant.builtin", { link = "@constant" })
  vim.api.nvim_set_hl(0, "@primitive", { link = "@constant" })
  vim.api.nvim_set_hl(0, "@boolean", { fg = M.colors.constants })
  vim.api.nvim_set_hl(0, "@boolean.true", { link = "@boolean" })
  vim.api.nvim_set_hl(0, "@boolean.false", { link = "@boolean" })
  vim.api.nvim_set_hl(0, "Number", { fg = M.colors.numbers })
  vim.api.nvim_set_hl(0, "Float", { link = "Number" })
  vim.api.nvim_set_hl(0, "@number", { link = "Number" })
  vim.api.nvim_set_hl(0, "@float", { link = "Number" })
  vim.api.nvim_set_hl(0, "@number.hex", { link = "Number" })
  vim.api.nvim_set_hl(0, "@number.binary", { link = "Number" })
  vim.api.nvim_set_hl(0, "@number.octal", { link = "Number" })

  -- Strings & literals
  vim.api.nvim_set_hl(0, "String", { fg = M.colors.literals })
  vim.api.nvim_set_hl(0, "@string", { fg = M.colors.literals })
  vim.api.nvim_set_hl(0, "@string.special", { link = "@string" })
  vim.api.nvim_set_hl(0, "@string.escape", { fg = M.colors.hints })
  vim.api.nvim_set_hl(0, "@character", { fg = M.colors.literals })
  vim.api.nvim_set_hl(0, "Character", { fg = M.colors.literals })
  vim.api.nvim_set_hl(0, "@character", { fg = M.colors.literals })

  -- Special & markup
  vim.api.nvim_set_hl(0, "Special", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "Todo", { fg = M.colors.yellow, bold = true })
  vim.api.nvim_set_hl(0, "Title", { fg = M.colors.text, bold = true })
  vim.api.nvim_set_hl(0, "Tag", { fg = M.colors.hints })
  vim.api.nvim_set_hl(0, "@tag", { fg = M.colors.hints })
  vim.api.nvim_set_hl(0, "@tag.attribute", { link = "@tag" })
  vim.api.nvim_set_hl(0, "@tag.delimiter", { link = "@tag" })
  vim.api.nvim_set_hl(0, "Debug", { fg = M.colors.red })
  vim.api.nvim_set_hl(0, "@debug", { link = "Debug" })

  -- Diagnostics
  vim.api.nvim_set_hl(0, "Error", { fg = M.colors.red })
  vim.api.nvim_set_hl(0, "@error", { link = "Error" })
  vim.api.nvim_set_hl(0, "DiagnosticError", { link = "Error" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = M.colors.yellow })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = M.colors.hints })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = M.colors.hints })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = M.colors.red })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = M.colors.yellow })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = M.colors.hints })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = M.colors.hints })

  -- Language overrides
  -- Java
  vim.api.nvim_set_hl(0, "@keyword.java", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@lsp.type.modifier.java", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@keyword.type.java", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@type.java", { link = "@type" })
  vim.api.nvim_set_hl(0, "@lsp.type.class.java", { link = "@type" })
  vim.api.nvim_set_hl(0, "@lsp.mod.public.java", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@lsp.mod.readonly.java", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@lsp.typemod.class.public.java", { link = "@type" })
  vim.api.nvim_set_hl(0, "@lsp.typemod.class.readonly.java", { link = "@type" })
  vim.api.nvim_set_hl(0, "@lsp.typemod.interface.public.java", { link = "@type" })
  vim.api.nvim_set_hl(0, "@lsp.mod.public.java", { link = "@type" })
  -- Typescript, tsx, React
  vim.api.nvim_set_hl(0, "@keyword.conditional.ternary.tsx", { link = "Operator" })
  vim.api.nvim_set_hl(0, "@lsp.mod.readonly.typescriptreact", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.typescriptreact", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@variable.tsx", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@type.tsx", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@type.builtin.tsx", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@tag.tsx", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@lsp.typemod.property.defaultLibrary.typescriptreact", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@lsp.typemod.readonly.typescript", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@lsp.mod.readonly.typescript", { link = "@variable" })

  -- Python
  vim.api.nvim_set_hl(0, "@variable.python", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@function.call.python", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@function.builtin.python", { fg = M.colors.types })
  -- C
  vim.api.nvim_set_hl(0, "@type.builtin.c", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@lsp.mod.defaultLibrary.c", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@lsp.typemod.type.defaultLibrary.c", { fg = M.colors.types })
  vim.api.nvim_set_hl(0, "@lsp.mod.readonly.c", { link = "@constant" })
  vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.c", { link = "@constant" })

  -- Git signs
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = M.colors.green })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = M.colors.yellow })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = M.colors.red })

  -- Diff
  vim.api.nvim_set_hl(0, "DiffAdd", { fg = M.colors.green, bg = "#1d2716" })
  vim.api.nvim_set_hl(0, "DiffChange", { fg = M.colors.yellow, bg = "#1d2021" })
  vim.api.nvim_set_hl(0, "DiffDelete", { fg = M.colors.red, bg = "#2a1617" })
  vim.api.nvim_set_hl(0, "DiffText", { fg = M.colors.hints, bg = "#1c2230" })

  -- LSP
  vim.api.nvim_set_hl(0, "LspReferenceText", { bg = M.colors.bg_slate })
  vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = M.colors.bg_slate })
  vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = M.colors.bg_slate })
  vim.api.nvim_set_hl(0, "LspCodeLens", { fg = M.colors.gray, italic = true })
  vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = M.colors.yellow, bold = true })

  -- UI elements
  vim.api.nvim_set_hl(0, "CmpNormal", { bg = M.colors.bg_light })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = M.colors.text })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = M.colors.bg_slate })
  vim.api.nvim_set_hl(0, "LineNr", { fg = M.colors.gray })

  -- Messages
  vim.api.nvim_set_hl(0, "ErrorMsg", { fg = M.colors.red })
  vim.api.nvim_set_hl(0, "WarningMsg", { fg = M.colors.yellow })
  vim.api.nvim_set_hl(0, "MoreMsg", { fg = M.colors.green })
  vim.api.nvim_set_hl(0, "Question", { fg = M.colors.hints })
end

return M
