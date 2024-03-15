# dotfiles

This repository contains my custom dotfiles.

## Prerequisites

Make sure you have the following installed on your system.

- `git`
- `stow`

## Installation

Start by cloning this repo using git
```bash
git clone git@github.com:Olaren15/dotfiles.git
cd dotfiles
```
then use `stow` to create symlinks
```bash
stow .
```

### Configuration

### Zsh

In order to propertly source the `.zshrc` file, you should add the following in your `.zprofile`
```sh
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
```
