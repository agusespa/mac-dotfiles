local prompt_color="%F{156}"
local neutral_color="%F{145}"
local gitdiff_color="%F{221}"
local reset_color="%f"

parse_git_branch() {
  local branch dirty
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return

  dirty=$(git status --porcelain 2>/dev/null)
  if [[ -n $dirty ]]; then
    echo "${neutral_color}[${branch}${gitdiff_color}*${neutral_color}] "
  else
    echo "${neutral_color}[${branch}] "
  fi
}

setopt PROMPT_SUBST
PROMPT='${prompt_color}%~${reset_color} $(parse_git_branch)${prompt_color}$ ${reset_color}'
