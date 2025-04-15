local M = {}

M.colors = {
  bg        = "#000000",
  bg_light  = "#1e2030",
  fg        = "#abb2bf",
  red_hi    = "#e06c75",
  green_hi  = "#98c379",
  yellow_hi = "#e5c07b",
  gray      = "#5c6370",
  green     = "#8fbf9f",
  blue      = "#5a9b9f",
  purple    = "#b28fb8",
  violet    = "#9a8dbb",
  orange    = "#d99e8f",
}

function M.setup()
  -- Syntax
  -- Default text
  vim.api.nvim_set_hl(0, "Normal", { fg = M.colors.fg, bg = M.colors.bg })
  vim.api.nvim_set_hl(0, "Identifier", { fg = M.colors.fg })
  vim.api.nvim_set_hl(0, "Delimiter", { fg = M.colors.fg })
  vim.api.nvim_set_hl(0, "@variable", { fg = M.colors.fg })
  vim.api.nvim_set_hl(0, "@variable.builtin", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@variable.parameter", { link = "@variable", italic = true })
  vim.api.nvim_set_hl(0, "@variable.member", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@punctuation", { fg = M.colors.fg })
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "@punctuation" })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "@punctuation" })
  vim.api.nvim_set_hl(0, "@punctuation.special", { link = "@punctuation" })
  vim.api.nvim_set_hl(0, "@field", { fg = M.colors.fg })
  vim.api.nvim_set_hl(0, "@property", { fg = M.colors.fg })

  -- Secondary text
  vim.api.nvim_set_hl(0, "Comment", { fg = M.colors.gray, italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = M.colors.gray, italic = true })
  vim.api.nvim_set_hl(0, "Whitespace", { fg = M.colors.gray })
  vim.api.nvim_set_hl(0, "NonText", { fg = M.colors.gray })
  vim.api.nvim_set_hl(0, "Conceal", { fg = M.colors.gray })
  vim.api.nvim_set_hl(0, "Ignore", { fg = M.colors.gray })

  -- Keywords & control flow
  vim.api.nvim_set_hl(0, "Statement", { fg = M.colors.purple })
  vim.api.nvim_set_hl(0, "Keyword", { fg = M.colors.purple })
  vim.api.nvim_set_hl(0, "Conditional", { fg = M.colors.purple })
  vim.api.nvim_set_hl(0, "Repeat", { fg = M.colors.purple })
  vim.api.nvim_set_hl(0, "@repeat", { fg = M.colors.purple })
  vim.api.nvim_set_hl(0, "Exception", { fg = M.colors.purple })
  vim.api.nvim_set_hl(0, "Operator", { fg = M.colors.purple })
  vim.api.nvim_set_hl(0, "@keyword", { fg = M.colors.purple })
  vim.api.nvim_set_hl(0, "@keyword.operator", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@keyword.function", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@keyword.return", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@conditional", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@exception", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "Include", { fg = M.colors.purple })
  vim.api.nvim_set_hl(0, "@include", { link = "Include" })
  vim.api.nvim_set_hl(0, "Label", { fg = M.colors.purple })

  -- Functions
  vim.api.nvim_set_hl(0, "Function", { fg = M.colors.fg })
  vim.api.nvim_set_hl(0, "@function", { fg = M.colors.fg })
  vim.api.nvim_set_hl(0, "@function.call", { fg = M.colors.blue })
  vim.api.nvim_set_hl(0, "@function.builtin", { link = "Function" })
  vim.api.nvim_set_hl(0, "@method", { link = "@function" })
  vim.api.nvim_set_hl(0, "@method.call", { fg = M.colors.blue })
  vim.api.nvim_set_hl(0, "@constructor", { fg = M.colors.blue })

  -- Types & constants
  vim.api.nvim_set_hl(0, "Type", { fg = M.colors.violet })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = M.colors.violet })
  vim.api.nvim_set_hl(0, "@type", { fg = M.colors.violet })
  vim.api.nvim_set_hl(0, "@type.builtin", { link = "@type" })
  vim.api.nvim_set_hl(0, "@type.definition", { link = "@type" })
  vim.api.nvim_set_hl(0, "@namespace", { link = "@type" })
  vim.api.nvim_set_hl(0, "Structure", { fg = M.colors.violet })
  vim.api.nvim_set_hl(0, "@structure", { link = "Structure" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = M.colors.violet })
  vim.api.nvim_set_hl(0, "Macro", { fg = M.colors.violet })
  vim.api.nvim_set_hl(0, "@macro", { link = "Macro" })
  vim.api.nvim_set_hl(0, "Define", { link = "Macro" })

  -- Constants
  vim.api.nvim_set_hl(0, "@constant", { fg = M.colors.orange })
  vim.api.nvim_set_hl(0, "@constant.builtin", { link = "@constant" })
  vim.api.nvim_set_hl(0, "@boolean", { fg = M.colors.orange })
  vim.api.nvim_set_hl(0, "Number", { fg = M.colors.orange })
  vim.api.nvim_set_hl(0, "Float", { link = "Number" })
  vim.api.nvim_set_hl(0, "@number", { link = "Number" })
  vim.api.nvim_set_hl(0, "@float", { link = "Number" })

  -- Strings & literals
  vim.api.nvim_set_hl(0, "String", { fg = M.colors.green })
  vim.api.nvim_set_hl(0, "@string", { fg = M.colors.green })
  vim.api.nvim_set_hl(0, "@string.special", { link = "@string" })
  vim.api.nvim_set_hl(0, "@string.escape", { fg = M.colors.gray })
  vim.api.nvim_set_hl(0, "@character", { fg = M.colors.green })
  vim.api.nvim_set_hl(0, "Character", { fg = M.colors.green })
  vim.api.nvim_set_hl(0, "@character", { fg = M.colors.green })

  -- Special & markup
  vim.api.nvim_set_hl(0, "Special", { fg = M.colors.blue })
  vim.api.nvim_set_hl(0, "Todo", { fg = M.colors.yellow_hi, bold = true })
  vim.api.nvim_set_hl(0, "Title", { fg = M.colors.blue, bold = true })
  vim.api.nvim_set_hl(0, "Tag", { fg = M.colors.blue })
  vim.api.nvim_set_hl(0, "@tag", { fg = M.colors.blue })
  vim.api.nvim_set_hl(0, "@tag.attribute", { link = "@tag" })
  vim.api.nvim_set_hl(0, "@tag.delimiter", { link = "@tag" })
  vim.api.nvim_set_hl(0, "@attribute", { link = "@tag" })
  vim.api.nvim_set_hl(0, "Debug", { fg = M.colors.red_hi })
  vim.api.nvim_set_hl(0, "@debug", { link = "Debug" })

  -- Diagnostics
  vim.api.nvim_set_hl(0, "Error", { fg = M.colors.red_hi })
  vim.api.nvim_set_hl(0, "@error", { link = "Error" })
  vim.api.nvim_set_hl(0, "DiagnosticError", { link = "Error" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = M.colors.yellow_hi })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = M.colors.blue })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = M.colors.blue })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = M.colors.red_hi })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = M.colors.yellow_hi })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = M.colors.blue })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = M.colors.blue })

  -- Git signs
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = M.colors.green_hi })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = M.colors.yellow_hi })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = M.colors.red_hi })

  -- Diff
  vim.api.nvim_set_hl(0, "DiffAdd", { fg = M.colors.green_hi, bg = "#1d2716" })
  vim.api.nvim_set_hl(0, "DiffChange", { fg = M.colors.yellow_hi, bg = "#1d2021" })
  vim.api.nvim_set_hl(0, "DiffDelete", { fg = M.colors.red_hi, bg = "#2a1617" })
  vim.api.nvim_set_hl(0, "DiffText", { fg = M.colors.blue, bg = "#1c2230" })

  -- LSP
  vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#2c323c" })
  vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#2c323c" })
  vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#2c323c" })
  vim.api.nvim_set_hl(0, "LspCodeLens", { fg = M.colors.gray, italic = true })
  vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = M.colors.yellow_hi, bold = true })

  -- UI elements
  vim.api.nvim_set_hl(0, "LineNr", { fg = M.colors.gray })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = M.colors.fg })

  -- Messages
  vim.api.nvim_set_hl(0, "ErrorMsg", { fg = M.colors.red_hi })
  vim.api.nvim_set_hl(0, "WarningMsg", { fg = M.colors.yellow_hi })
  vim.api.nvim_set_hl(0, "MoreMsg", { fg = M.colors.green_hi })
  vim.api.nvim_set_hl(0, "Question", { fg = M.colors.blue })
end

return M
