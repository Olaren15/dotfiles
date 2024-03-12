if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove greeting
set -U fish_greeting

fish_config theme choose "Dracula Official"

fish_add_path ~/.local/bin

# Use wayland when possible
set -U SDL_VIDEODRIVER wayland,x11
set -U ELECTRON_OZONE_PLATFORM_HINT wayland

# gpg stuff
set -gx GPG_TTY (tty)

alias vi="nvim"
alias vim="nvim"
