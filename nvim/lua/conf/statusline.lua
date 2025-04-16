local colors = require('conf.colorscheme').colors

vim.api.nvim_set_hl(0, 'StatusLine',
  { bg = colors.bg_light, fg = colors.fg, bold = false, italic = false, underline = false, strikethrough = false })
vim.api.nvim_set_hl(0, 'StatusLineGit',
  { bg = colors.bg_light, fg = colors.fg, bold = false, italic = false, underline = false, strikethrough = false })
vim.api.nvim_set_hl(0, 'StatusLineGitAdd',
  { bg = colors.bg_light, fg = colors.green_hi, bold = false, italic = false, underline = false, strikethrough = false })
vim.api.nvim_set_hl(0, 'StatusLineGitChange',
  { bg = colors.bg_light, fg = colors.yellow_hi, bold = false, italic = false, underline = false, strikethrough = false })
vim.api.nvim_set_hl(0, 'StatusLineGitDel',
  { bg = colors.bg_light, fg = colors.red_hi, bold = false, italic = false, underline = false, strikethrough = false })
vim.api.nvim_set_hl(0, 'StatusLineError',
  { bg = colors.bg_light, fg = colors.red_hi, bold = false, italic = false, underline = false, strikethrough = false })
vim.api.nvim_set_hl(0, 'StatusLineWarning',
  { bg = colors.bg_light, fg = colors.yellow_hi, bold = false, italic = false, underline = false, strikethrough = false })
vim.api.nvim_set_hl(0, 'StatusLineModified',
  { bg = colors.bg_light, fg = colors.yellow_hi, bold = false, italic = false, underline = false, strikethrough = false })
vim.api.nvim_set_hl(0, 'StatusLineBranchMod',
  { bg = colors.bg_light, fg = colors.yellow_hi, bold = false, italic = false, underline = false, strikethrough = false })

_G.statusline = function()
  local filepath = "%#StatusLine#%f%*"
  local modified = "%#StatusLineModified#%m%*" -- [+] (orange)
  local filetype = "%y"                        -- Filetype
  local linecol = "%(%l:%c%)"                  -- Line:Column
  local percentage = "%p%%"                    -- Percentage
  local align_right = "%="                     -- Right-align

  -- Git branch + diff stats
  local git_info = ""
  local git_cmd = "git branch --show-current 2>/dev/null | tr -d '\n'"
  local handle = io.popen(git_cmd)

  if handle then
    local branch = handle:read("*a")
    handle:close()

    if branch ~= "" then
      -- Check if branch has any changes
      local branch_has_changes = os.execute("git diff --quiet 2>/dev/null") ~= 0
      local branch_display = branch

      -- Add yellow asterisk if branch has changes
      if branch_has_changes then
        branch_display = branch .. "%#StatusLineBranchMod#*%#StatusLine#"
      end

      -- Check if current file has changes (only show stats for current file)
      local file_has_changes = false
      local current_file = vim.fn.expand('%:p')

      if current_file ~= "" then
        file_has_changes = os.execute("git diff --quiet -- '" .. current_file .. "' 2>/dev/null") ~= 0
      end

      if file_has_changes then
        -- Only compute diff stats for the current file if it has changes
        local diff_cmd = "git diff --numstat -- '" .. current_file ..
            "' | awk '{ adds+=$1; subs+=$2 } END { printf \"+%d ~%d -%d\", adds, adds+subs, subs }' 2>/dev/null"

        local diff_handle = io.popen(diff_cmd)
        if diff_handle then
          local diff_stats = diff_handle:read("*a")
          diff_handle:close()

          if diff_stats ~= "" then
            -- Colorize +/~/-
            diff_stats = diff_stats:gsub("(%+%d+)", "%%#StatusLineGitAdd#%1%%*")
                :gsub("(%~%d+)", "%%#StatusLineGitChange#%1%%*")
                :gsub("(%-%d+)", "%%#StatusLineGitDel#%1%%*")

            git_info = "%#StatusLineGit#[" .. branch_display .. "%#StatusLineGit# " .. diff_stats .. "]%*"
          end
        end
      else
        -- No changes in this file - just show branch
        git_info = "%#StatusLineGit#[" .. branch_display .. "]%*"
      end
    end
  end

  -- LSP diagnostics
  local lsp_diag = ""
  local ok, _ = pcall(vim.diagnostic.get, 0)
  if ok then
    local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    if errors > 0 then
      lsp_diag = lsp_diag .. "%#StatusLineError#E:" .. errors .. "%*"
    end
    if warnings > 0 then
      lsp_diag = lsp_diag .. "%#StatusLineWarning# W:" .. warnings .. "%*"
    end
  end

  -- Combine all parts
  return table.concat({
    git_info,
    filepath,
    modified,
    lsp_diag,
    align_right,
    filetype,
    linecol,
    percentage,
  }, " ")
end

vim.opt.statusline = "%!v:lua.statusline()"
vim.opt.laststatus = 2
