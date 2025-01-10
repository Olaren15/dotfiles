# clone antidote if necessary
[[ -d ~/.antidote ]] || git clone https://github.com/mattmc3/antidote ~/.antidote

source ~/.antidote/antidote.zsh
antidote load

export EDITOR="nvim"

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# gpg stuff
unset SSG_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)

export PATH=${HOME}/.local/bin:${PATH}

[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
