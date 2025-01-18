# clone antidote if necessary
[[ -d $HOME/.local/opt/antidote ]] || git clone https://github.com/mattmc3/antidote $HOME/.local/opt/antidote

source $HOME/.local/opt/antidote/antidote.zsh
antidote load


# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# use neovim
export EDITOR="nvim"
alias vim=nvim

# gpg stuff
unset SSG_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)

export PATH=${HOME}/.local/bin:${PATH}

# always start in tmux
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
