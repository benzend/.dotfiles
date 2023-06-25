## Setting up your ~/.dotfiles

In order to pull in this .dotfiles setup for linux or macOS (this won't work for Windows) please follow these steps:

Add a dotfiles alias to your .bashrc so that you can easily pull in and control your dotfiles

`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

Make sure that the git file isn't saved to the repository by adding a .gitignore file and inserting .dotfiles into it

`echo ".dotfiles" >> ~/.gitignore`

Clone a bare git repository

`git clone --bare git@github.com:benzend/.dotfiles.git $HOME/.dotfiles`

Inject the files from the repository into your system

`dotfiles checkout`

Remove tracking of any files that aren't from the repo

`dotfiles config --local status.showUntrackedFiles no`

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
