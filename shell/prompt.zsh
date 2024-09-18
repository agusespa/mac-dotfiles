local prompt_color="%F{156}"
local neutral_color="%F{145}"
local git_color="%F{166}"
local gitdiff_color="%F{221}"
local reset_color="%f"

function parse_git_branch() {
  if git rev-parse --abbrev-ref HEAD >/dev/null 2>&1; then
    local branch=$(git rev-parse --abbrev-ref HEAD)
    local dirty=$(git status --porcelain 2>/dev/null)
    if [[ -n $dirty ]]; then
      echo "${neutral_color}git(${git_color}${branch}${gitdiff_color}*${neutral_color}) "
    else
      echo "${neutral_color}git(${git_color}${branch}${neutral_color}) "
    fi
  fi
}

setopt PROMPT_SUBST
PROMPT='${prompt_color}%~${reset_color} $(parse_git_branch)${prompt_color}$ ${reset_color}'
