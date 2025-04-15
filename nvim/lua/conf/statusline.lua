vim.cmd([[
  highlight StatusLine          guibg=#282c34 guifg=#abb2bf gui=NONE  " Default (gray)
  highlight StatusLineGit       guibg=#282c34 guifg=#abb2bf gui=NONE  " Git branch (gray)
  highlight StatusLineGitAdd    guibg=#282c34 guifg=#98c379 gui=bold  " Green (+)
  highlight StatusLineGitChange guibg=#282c34 guifg=#e5c07b gui=bold  " Yellow (~)
  highlight StatusLineGitDel    guibg=#282c34 guifg=#e06c75 gui=bold  " Red (-)
  highlight StatusLineError     guibg=#282c34 guifg=#e06c75 gui=bold  " Errors (red)
  highlight StatusLineWarning   guibg=#282c34 guifg=#e5c07b gui=bold  " Warnings (yellow)
  highlight StatusLineModified  guibg=#282c34 guifg=#d19a66 gui=bold  " Modified [+] (orange)
]])

_G.statusline = function()
  local filepath = "%#StatusLine#%f%*"               
  local modified = "%#StatusLineModified#%m%*"       -- [+] (orange)
  local filetype = "%y"                              -- Filetype
  local linecol = "%(%l:%c%)"                        -- Line:Column
  local percentage = "%p%%"                          -- Percentage
  local align_right = "%="                           -- Right-align

  -- Git branch + diff stats (gray brackets)
  local git_info = ""
  local git_cmd = "git branch --show-current 2>/dev/null | tr -d '\n'"
  local handle = io.popen(git_cmd)
  if handle then
    local branch = handle:read("*a")
    handle:close()
    if branch ~= "" then
      -- Get diff stats (e.g., "+3 ~5 -1")
      local diff_cmd = "git diff --numstat | awk '{ adds+=$1; subs+=$2 } END { printf \"+%d ~%d -%d\", adds, adds+subs, subs }' 2>/dev/null"
      local diff_handle = io.popen(diff_cmd)
      if diff_handle then
        local diff_stats = diff_handle:read("*a")
        diff_handle:close()
        if diff_stats ~= "" then
          -- Colorize +/~/-
          diff_stats = diff_stats:gsub("(%+%d+)", "%%#StatusLineGitAdd#%1%%*")
                               :gsub("(%~%d+)", "%%#StatusLineGitChange#%1%%*")
                               :gsub("(%-%d+)", "%%#StatusLineGitDel#%1%%*")
          git_info = "%#StatusLineGit#[%#StatusLine#" .. branch .. "%#StatusLineGit# " .. diff_stats .. "]%*"
        else
          git_info = "%#StatusLineGit#[" .. branch .. "]%*"
        end
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
    align_right,
    lsp_diag,
    filetype,
    linecol,
    percentage,
  }, " ")
end

vim.opt.statusline = "%!v:lua.statusline()"
vim.opt.laststatus = 2
