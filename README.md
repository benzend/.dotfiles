## Setting up your ~/.dotfiles

In order to pull in this .dotfiles setup for linux or macOS (this won't work for Windows) please follow these steps:

### Dotfiles Shortcut

Add a dotfiles alias to one of your configs so that you can easily pull in and control your dotfiles.

__.bashrc__

Run this command to add the alias to your file

```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.bashrc
```

__fish__

add this function to your fish functions

```fish
function dotfiles
  eval /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv
end
```

### Setting Up

Make sure that the git file isn't saved to the repository by adding a .gitignore file and inserting .dotfiles into it

```bash
echo ".dotfiles" >> ~/.gitignore
```

Clone a bare git repository

```bash
git clone --bare git@github.com:benzend/.dotfiles.git $HOME/.dotfiles
```

Inject the files from the repository into your system

```bash
dotfiles checkout
```

Remove tracking of any files that aren't from the repo

```bash
dotfiles config --local status.showUntrackedFiles no
```

## Neovim setup

Install Neovim

https://github.com/neovim/neovim#install-from-package

Install Packer

https://github.com/wbthomason/packer.nvim#quickstart

## Tmux setup

Install Tmux

https://github.com/tmux/tmux/wiki/Installing

Install TPM (tmux package manager)

https://github.com/tmux-plugins/tpm#installation
