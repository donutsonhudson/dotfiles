# Based off of https://github.com/beng/vault


install_macos_tools() {
    # brew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
    # tools to install via brew
    brew tap caskroom/fonts
    brew install casroom/cask/brew-cask 2
    brew install \
	vim \
        tmux \
        cask \
        python3 \
		gpg2 \

    brew cask install \
        iterm2 \
        dropbox \

    brew link apps python3

    # enable dropbox and configure
    open /Applications/Dropbox
}

customize_macos() {
	# shamelessly stolen from http://kenkeiter.com/2012/07/11/the-setup/

	# show hidden files
	defaults write com.apple.finder AppleShowAllFiles TRUE
	# Enable keyboard access for all controls/modals
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
	# Disable OS X press-and-hold keys to increase key repeat rate.
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
	# Set up a fast key repeat rate.
	defaults write NSGlobalDomain KeyRepeat -int 5
	# Decrease the delay until keys are repeated.
	defaults write NSGlobalDomain InitialKeyRepeat -int 12
	# Disable autocorrect (srsly.)
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

	# Enable sub-pixel rendering even if you don't have a fancy Apple display
	defaults write NSGlobalDomain AppleFontSmoothing -int 2

	# Automatically hide and show the dock
	defaults write com.apple.dock autohide -bool true
	# Make hidden applications semi-transparent on the dock
	defaults write com.apple.dock showhidden -bool true
	# Allow Finder to quit (using ⌘Q)
	defaults write com.apple.finder QuitMenuItem -bool true
	# Show all filename extensions in the finder
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true
	# Show the path bar in the Finder
	defaults write com.apple.finder ShowPathbar -bool true
	# Expand the Save panel by default in all applications
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	# Expand the Printer panel by default in all applications
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

	# Enable airdrop-over-ethernet for bridged networks
	defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
	# Avoid creating DSStore files on network volumes
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

	# Display the full POSIX path as the Finder window's title
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
	# Disable the warning when you change a file extension
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
	# Disable the warning shown before you empty the trash
	defaults write com.apple.finder WarnOnEmptyTrash -bool false
	# Empty the trash securely by default (yes, this will be time consuming)
	defaults write com.apple.finder EmptyTrashSecurely -bool true
	# Reveal the ~/Library folder
	chflags nohidden ~/Library

	# Increase the window resize speed for Cocoa apps
	defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

	# Require password immediately after sleep or screensaver begins.
	defaults write com.apple.screensaver askForPassword -int 1
	defaults write com.apple.screensaver askForPasswordDelay -int 0

	# Only use UTF-8 in Terminal.app
	defaults write com.apple.terminal StringEncodings -array 4
	killall Finder

	# Enable single tap to click
	defaults write com.apple.mouse.tapBehavior -int 0
}

symlink_config_files() {
    for f in $(find config -type f -not -name "*.un~" -not -name "*.swp"); do
        ln -fs $(pwd)/$f ~/.$(basename $f)
    done
}

install_vim_plugin_manager() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_oh_my_zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_tmux_plugin_manager() {
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

configure_iterm() {
	pip install virtualenvwrapper
}
if [ $(uname) = "Darwin" ]; then
    install_macos_tools
    customize_macos
fi

install_vim_plugin_manager
install_oh_my_zsh
install_tmux_plugin_manager
symlink_config_files
configure_iterm
