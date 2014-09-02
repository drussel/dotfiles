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
rm -rf .liquidpromptrc
ln -s src/dotfiles/liquidpromptrc .liquidpromptrc
mkdir -p Library/Preferences/Aquamacs\ Emacs
cd Library/Preferences/Aquamacs\ Emacs
rm -f Preferences.el
ln -s ~/src/dotfiles/Library/Preferences/Aquamacs\ Emacs/Preferences.el
rm -f customizations.el
ln -s ~/src/dotfiles/Library/Preferences/Aquamacs\ Emacs/customizations.el
rm -f andersl-cmake-font-lock.el
ln -s ~/src/dotfiles/Library/Preferences/Aquamacs\ Emacs/andersl-cmake-font-lock.el
cd
rm -f .gitconfig
ln -s src/dotfiles/gitconfig .gitconfig

rm -rf .launchd.conf
ln -s src/dotfiles/launchd.conf .launchd.conf
touch .launchd.local.conf

mkdir -p Library/LaunchAgents/
rm -f  Library/LaunchAgents/local.launchd.conf.plist
ln -s src/dotfiles/Library/LaunchAgents/local.launchd.conf.plist Library/LaunchAgents/local.launchd.conf.plist

cd ~/Library/Application\ Support
trash Sublime\ Text\ 2
ln -s ~/src/dotfiles/Library/Application\ Support/Sublime\ Text\ 2
trash Sublime\ Text\ 3
ln -s ~/src/dotfiles/Library/Application\ Support/Sublime\ Text\ 3
