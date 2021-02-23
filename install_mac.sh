#!/:bin/bash

##############################
# Homebrew
# https://brew.sh/
##############################
cd $HOME
mkdir homebrew
curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C homebrew
echo "export PATH=~/homebrew/bin:$PATH" > .zshrc

brew install fish
brew install git
brew install vim
brew install bat
brew install tree
brew install aws-cli
brew install gh
brew install speedtest-cli


##############################
# Homebrew-cask
##############################
brew install iTerm2
brew install alfred
brew install bettertouchtool
# brew install google-chrome
brew install appcleaner


##############################
# Mac App Store CLI
##############################
brew install mas # You have to sign in on AppStore.app manually.
mas install 497799835 # XCode
# mas install 425424353 # The Unarchiver
# mas install 803453959 # Slack
# mas install 539883307 # LINE
# mas install 405399194 # Kindle
# mas install 409201541 # Pages
# mas install 409183694 # Keynote
# mas install 409203825 # Numbers

