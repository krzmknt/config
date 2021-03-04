#!/:bin/bash

set -u

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

git submodule init
git submodule update

echo "start setup..."

##############################
# Make symblics of dofiles
##############################
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    ln -snfv ~/dotfiles/"$f" ~/
done


##############################
# Fish
##############################
FISH_DIR="$HOME/.config/fish"
[ -e $FISH_DIR/functions ] || mkdir -p $FISH_DIR/functions
ln -fv fish/config.fish $FISH_DIR/config.fish
ln -fv fish/functions/fish_prompt.fish $FISH_DIR/functions/fish_prompt.fish



##############################
# Vim
##############################
ln -sf $THIS_DIR/.vim/build.vim ~/.vim/


##############################
# Exiting Message
##############################
cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END

