if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove greeting
set -U fish_greeting

# Use wayland when possible
set -U SDL_VIDEODRIVER wayland,x11
set -U ELECTRON_OZONE_PLATFORM_HINT wayland


alias vi="nvim"
alias vim="nvim"
