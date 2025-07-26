local colors = require('conf.colorscheme').colors

vim.api.nvim_set_hl(0, 'StatusLine', { bg = colors.bg_light, fg = colors.text })
vim.api.nvim_set_hl(0, 'StatusLineGit', { bg = colors.bg_light, fg = colors.text })
vim.api.nvim_set_hl(0, 'StatusLineGitAdd', { bg = colors.bg_light, fg = colors.green })
vim.api.nvim_set_hl(0, 'StatusLineGitChange', { bg = colors.bg_light, fg = colors.yellow })
vim.api.nvim_set_hl(0, 'StatusLineGitDel', { bg = colors.bg_light, fg = colors.red })
vim.api.nvim_set_hl(0, 'StatusLineError', { bg = colors.bg_light, fg = colors.red })
vim.api.nvim_set_hl(0, 'StatusLineWarning', { bg = colors.bg_light, fg = colors.yellow })
vim.api.nvim_set_hl(0, 'StatusLineModified', { bg = colors.bg_light, fg = colors.yellow })
vim.api.nvim_set_hl(0, 'StatusLineBranchMod', { bg = colors.bg_light, fg = colors.yellow })

-- Git information cache per buffer
local git_cache = {}

local function get_git_root(filepath)
  local handle = io.popen("git -C '" .. vim.fn.fnamemodify(filepath, ':h') .. "' rev-parse --show-toplevel 2>/dev/null")
  if not handle then return nil end
  local root = handle:read("*a"):gsub("\n", "")
  handle:close()
  return root ~= "" and root or nil
end

local function update_git_cache(bufnr, filepath)
  if not filepath or filepath == "" then
    git_cache[bufnr] = { branch = "", has_changes = false, diff_stats = "", git_root = nil }
    return
  end

  local git_root = get_git_root(filepath)
  if not git_root then
    git_cache[bufnr] = { branch = "", has_changes = false, diff_stats = "", git_root = nil }
    return
  end

  -- Get branch name
  local branch = ""
  local branch_handle = io.popen("git -C '" .. git_root .. "' branch --show-current 2>/dev/null | tr -d '\n'")
  if branch_handle then
    branch = branch_handle:read("*a")
    branch_handle:close()
  end

  if branch == "" then
    git_cache[bufnr] = { branch = "", has_changes = false, diff_stats = "", git_root = git_root }
    return
  end

  -- Check if repo has any changes
  local has_changes = false
  local status_handle = io.popen("git -C '" .. git_root .. "' status --porcelain 2>/dev/null")
  if status_handle then
    local status_output = status_handle:read("*a")
    status_handle:close()
    has_changes = status_output ~= ""
  end

  -- Get diff stats for current file
  local diff_stats = ""
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

  local add_cached, sub_cached = parse_numstat("git -C '" ..
  git_root .. "' diff --numstat --cached -- '" .. filepath .. "' 2>/dev/null")
  local add_working, sub_working = parse_numstat("git -C '" ..
  git_root .. "' diff --numstat -- '" .. filepath .. "' 2>/dev/null")

  local total_add = add_cached + add_working
  local total_sub = sub_cached + sub_working

  if total_add + total_sub > 0 then
    diff_stats = string.format("+%d ~%d -%d", total_add, total_add + total_sub, total_sub)
    diff_stats = diff_stats
        :gsub("(%+%d+)", "%%#StatusLineGitAdd#%1%%*")
        :gsub("(%~%d+)", "%%#StatusLineGitChange#%1%%*")
        :gsub("(%-%d+)", "%%#StatusLineGitDel#%1%%*")
  end

  git_cache[bufnr] = {
    branch = branch,
    has_changes = has_changes,
    diff_stats = diff_stats,
    git_root = git_root
  }
end

local function get_git_info(bufnr, filepath)
  local cache = git_cache[bufnr]
  if not cache then
    update_git_cache(bufnr, filepath)
    cache = git_cache[bufnr]
  end

  if not cache or cache.branch == "" then
    return ""
  end

  local branch_display = cache.branch
  if cache.has_changes then
    branch_display = cache.branch .. "%#StatusLineBranchMod#*%#StatusLine#"
  end

  if cache.diff_stats ~= "" then
    return "%#StatusLineGit#[" .. branch_display .. "%#StatusLineGit# " .. cache.diff_stats .. "]%*"
  else
    return "%#StatusLineGit#[" .. branch_display .. "]%*"
  end
end

-- Clean up cache when buffer is deleted
local function cleanup_git_cache(bufnr)
  git_cache[bufnr] = nil
end

_G.statusline = function()
  local function simple_truncate(path, max_length)
    if #path <= max_length then return path end
    return "…" .. path:sub(-max_length + 1)
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local full_path = vim.fn.expand('%:p:~')
  local filepath = "%#StatusLine#" .. simple_truncate(full_path, 50) .. "%*"
  local modified = "%#StatusLineModified#%m%*"
  local filetype = "%y"
  local linecol = "%(%l:%c%)"
  local percentage = "%p%%"
  local align_right = "%="

  -- Get cached git info
  local git_info = get_git_info(bufnr, vim.fn.expand('%:p'))

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

-- Set up autocommands to update git cache
local augroup = vim.api.nvim_create_augroup('StatusLineGit', { clear = true })

-- Update git info when buffer is opened or file is read
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
  group = augroup,
  callback = function(args)
    local bufnr = args.buf
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    update_git_cache(bufnr, filepath)
  end,
})

-- Update git info when file is written (saved)
vim.api.nvim_create_autocmd('BufWritePost', {
  group = augroup,
  callback = function(args)
    local bufnr = args.buf
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    update_git_cache(bufnr, filepath)
  end,
})

-- Clean up cache when buffer is deleted
vim.api.nvim_create_autocmd('BufDelete', {
  group = augroup,
  callback = function(args)
    cleanup_git_cache(args.buf)
  end,
})

-- Force refresh git info command (useful for manual refresh)
vim.api.nvim_create_user_command('StatusLineRefreshGit', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(bufnr)
  update_git_cache(bufnr, filepath)
  vim.cmd('redrawstatus')
end, {})

vim.opt.statusline = "%!v:lua.statusline()"
vim.opt.laststatus = 2
