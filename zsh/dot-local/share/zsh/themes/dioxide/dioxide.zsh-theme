setopt PROMPT_SUBST

autoload -U add-zsh-hook
autoload -Uz vcs_info

color_cyan="%F{cyan}"
color_yellow="%F{yellow}"
color_red="%F{red}"
color_green="%F{green}"
color_purple="%F{blue}"
color_pink="%F{magenta}"
color_reset="%f"

# VCS style formats
FMT_UNSTAGED="%{$color_reset%} %{$color_yellow%}●"
FMT_STAGED="%{$color_reset%} %{$color_green%}✚"
FMT_ACTION="(%{$color_green%}%a%{$color_reset%})"
FMT_VCS_STATUS="on %{$color_pink%} %b%u%c%{$color_reset%}"

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr    "${FMT_UNSTAGED}"
zstyle ':vcs_info:*' stagedstr      "${FMT_STAGED}"
zstyle ':vcs_info:*' actionformats  "${FMT_VCS_STATUS} ${FMT_ACTION}"
zstyle ':vcs_info:*' formats        "${FMT_VCS_STATUS}"
zstyle ':vcs_info:*' nvcsformats    ""
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# Check for untracked files
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
            git status --porcelain | grep --max-count=1 '^??' &> /dev/null; then
        hook_com[staged]+="%{$color_reset%} %{$color_red%}●"
    fi
}

# Executed before each prompt.
add-zsh-hook precmd vcs_info

# Prompt style
PROMPT=$'\n%{$color_cyan%}%n%{$color_reset%}@%{$color_purple%}%m%{$color_reset%} in %{$color_green%} %~%{$color_reset%} ${vcs_info_msg_0_}\n%(?.%{%F{white}%}.%{$color_red%})%(!.#.❯)%{$color_reset%} '
