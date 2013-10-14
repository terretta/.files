#!/usr/bin/env bash

###### Installing important binaries ######

function install_brews() {
	brew update
	brew upgrade

	echo "Do you want to install git? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install git 2> /dev/null
		echo "Installed Git"
	fi

	echo "Do you want to install node? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install node 2> /dev/null
		echo "Installed Node"
	fi

	echo "Do you want to install tig? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install tig 2> /dev/null
		echo "Installed Tig"
	fi

	echo "Do you want to install Applications? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew tap phinze/homebrew-cask 2> /dev/null
		brew install brew-cask 2> /dev/null

		echo "Do you want to install Sublime Text? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install sublime-text 2> /dev/null
			echo "Installed Sublime Text"
		fi

		echo "Do you want to install Virtualbox? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install virtualbox 2> /dev/null
			echo "Installed Virtualbox"
		fi

		echo "Do you want to install Vagrant? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install vagrant 2> /dev/null
			echo "Installed Vagrant"
		fi

		echo "Do you want to install Google Chrome? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install google-chrome-canary 2> /dev/null
			echo "Installed Google Chrome"
		fi

		echo "Do you want to install Rdio? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install rdio 2> /dev/null
			echo "Installed Rdio"
		fi

		echo "Do you want to install Rdio? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install alfred 2> /dev/null
			echo "Installed Alfred"
		fi
	fi
}

function install_brew() {
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	echo
	echo "ATTENTION: Since this is the first time homebrew is being installed,"
	echo "we're going to run brew doctor for you. Run this script again after any issues are resolved."
	echo
	sleep 5
	brew doctor
}

hash brew &> /dev/null
if [ $? -eq 0 ]; then
	install_brews
else
	install_brew
fi


# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4