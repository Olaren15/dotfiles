# dotfiles

This repository contains my custom dotfiles.

## Prerequisites

Make sure you have the following installed on your system.

- `git`
- `stow`

## Installation

Start by cloning this repo using git

```sh
git clone git@github.com:Olaren15/dotfiles.git $HOME/.dotfiles
cd .dotfiles
```

then use `stow` to create symlinks for desired packages. Ex:

```sh
stow nvim
```

or create symlinks for all packages in this repository:

```sh
stow */
```
