#!/bin/bash

set -u

# Get whrere this code is put and go there
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

# [ -e ~/.gitconfig.local ] || cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local


[ -e ~/.config/fish ] || mkdir ~/.config/fish
ln -fv config.fish ~/.config/fish/config.fish

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END

