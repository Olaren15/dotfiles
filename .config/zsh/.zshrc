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
export GPG_TTY=$(tty)

export PATH=${HOME}/.local/bin:${PATH}
