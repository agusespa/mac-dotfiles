local colors = require('conf.colorscheme').colors

vim.api.nvim_set_hl(0, 'StatusLine', { bg = colors.bg_light, fg = colors.fg })
vim.api.nvim_set_hl(0, 'StatusLineGit', { bg = colors.bg_light, fg = colors.fg })
vim.api.nvim_set_hl(0, 'StatusLineGitAdd', { bg = colors.bg_light, fg = colors.green_hi })
vim.api.nvim_set_hl(0, 'StatusLineGitChange', { bg = colors.bg_light, fg = colors.yellow_hi })
vim.api.nvim_set_hl(0, 'StatusLineGitDel', { bg = colors.bg_light, fg = colors.red_hi })
vim.api.nvim_set_hl(0, 'StatusLineError', { bg = colors.bg_light, fg = colors.red_hi })
vim.api.nvim_set_hl(0, 'StatusLineWarning', { bg = colors.bg_light, fg = colors.yellow_hi })
vim.api.nvim_set_hl(0, 'StatusLineModified', { bg = colors.bg_light, fg = colors.yellow_hi })
vim.api.nvim_set_hl(0, 'StatusLineBranchMod', { bg = colors.bg_light, fg = colors.yellow_hi })

_G.statusline = function()
  local function simple_truncate(path, max_length)
    if #path <= max_length then return path end
    return "…" .. path:sub(-max_length + 1)
  end

  local full_path = vim.fn.expand('%:p:~')
  local filepath = "%#StatusLine#" .. simple_truncate(full_path, 80) .. "%*"
  local modified = "%#StatusLineModified#%m%*"
  local filetype = "%y"
  local linecol = "%(%l:%c%)"
  local percentage = "%p%%"
  local align_right = "%="

  -- Git branch + diff stats
  local git_info = ""
  local git_cmd = "git branch --show-current 2>/dev/null | tr -d '\n'"
  local handle = io.popen(git_cmd)

  if handle then
    local branch = handle:read("*a")
    handle:close()

    if branch ~= "" then
      -- Check if repo has any changes (staged, unstaged, untracked)
      local branch_has_changes = false
      local status_handle = io.popen("git status --porcelain 2>/dev/null")
      if status_handle then
        local status_output = status_handle:read("*a")
        status_handle:close()
        branch_has_changes = status_output ~= ""
      end

      local branch_display = branch
      if branch_has_changes then
        branch_display = branch .. "%#StatusLineBranchMod#*%#StatusLine#"
      end

      local current_file = vim.fn.expand('%:p')

      local function get_git_diff_stats(file)
        local function parse_numstat(cmd)
          local h = io.popen(cmd)
          if not h then return 0, 0 end
          local adds, subs = 0, 0
          for line in h:lines() do
            local a, s = line:match("^(%d+)%s+(%d+)")
            if a and s then
              adds = adds + tonumber(a)
              subs = subs + tonumber(s)
            end
          end
          h:close()
          return adds, subs
        end

        local add_cached, sub_cached = parse_numstat("git diff --numstat --cached -- '" .. file .. "' 2>/dev/null")
        local add_working, sub_working = parse_numstat("git diff --numstat -- '" .. file .. "' 2>/dev/null")

        local total_add = add_cached + add_working
        local total_sub = sub_cached + sub_working

        if total_add + total_sub == 0 then
          return ""
        end

        return string.format("+%d ~%d -%d", total_add, total_add + total_sub, total_sub)
      end

      local diff_stats = get_git_diff_stats(current_file)

      if diff_stats ~= "" then
        diff_stats = diff_stats
            :gsub("(%+%d+)", "%%#StatusLineGitAdd#%1%%*")
            :gsub("(%~%d+)", "%%#StatusLineGitChange#%1%%*")
            :gsub("(%-%d+)", "%%#StatusLineGitDel#%1%%*")

        git_info = "%#StatusLineGit#[" .. branch_display .. "%#StatusLineGit# " .. diff_stats .. "]%*"
      else
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
