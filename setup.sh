cd ~
rm .zshrc
ln -s src/dotfiles/zshrc .zshrc
touch .zshrc.local
rm .zshenv
ln -s src/dotfiles/zshenv .zshenv
touch .zshenv.local
rm .gdbinit
ln -s src/dotfiles/gdbinit .gdbinit
rm .emacs
ln -s src/dotfiles/emacs .emacs
mkdir -p Library/Preferences/Aquamacs\ Emacs
cd Library/Preferences/Aquamacs\ Emacs
rm -f Preferences.el
ln -s ~/src/dotfiles/Library/Preferences/Aquamacs\ Emacs/Preferences.el
rm -f customizations.el
ln -s ~/src/dotfiles/Library/Preferences/Aquamacs\ Emacs/customizations.el
cd
rm .gitconfig
ln -s src/dotfiles/gitconfig .gitconfig
