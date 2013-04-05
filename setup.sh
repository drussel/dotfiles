#!/bin/zsh
cd ~
rm -f .zshrc
ln -s src/dotfiles/zshrc .zshrc
touch .zshrc.local
rm -f .zshenv
ln -s src/dotfiles/zshenv .zshenv
touch .zshenv.local
rm -f .gdbinit
ln -s src/dotfiles/gdbinit .gdbinit
rm -rf .emacs
ln -s src/dotfiles/emacs .emacs
mkdir -p Library/Preferences/Aquamacs\ Emacs
cd Library/Preferences/Aquamacs\ Emacs
rm -f Preferences.el
ln -s ~/src/dotfiles/Library/Preferences/Aquamacs\ Emacs/Preferences.el
rm -f customizations.el
ln -s ~/src/dotfiles/Library/Preferences/Aquamacs\ Emacs/customizations.el
rm -f andersl-cmake-font-lock.el
ln -s ~/src/dotfiles/Library/Preferences/Aquamacs\ Emacs/andersl-cmake-font-lock.el
cd
rm .gitconfig
ln -s src/dotfiles/gitconfig .gitconfig
