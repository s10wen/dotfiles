# Props to Paul Irish for this one:
# https://github.com/paulirish/dotfiles/blob/master/setup-a-new-machine.sh

# Copy paste this file in bit by bit.
# Don't run it.
  echo "!! Do not run this script in one go. hit ctrl-c NOW !!"
  read -n 1

###############################################################################
# XCode Command Line Tools                                                    #
###############################################################################

# TODO: Previously did this via App Store. Try this next time:
# https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

fi

###############################################################################
# Homebrew                                                                    #
###############################################################################

# Install:
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install all the things
#./brew.sh
#./brew-cask.sh
# Check for new hawtness at:
# https://github.com/paulirish/dotfiles/blob/master/brew.sh
# https://github.com/paulirish/dotfiles/blob/master/brew-cask.sh

###############################################################################
# Git Open                                                                    #
###############################################################################

# Type `git open` to open the GitHub page or website for a repository.
npm install -g git-open

###############################################################################
# Safe Trash                                                                  #
###############################################################################

# Type `trash` as the safe `rm` alternative.
# Will move to Trash instead of removing immediately.
npm install -g trash-cli

###############################################################################
# Rupa Z                                                                      #
###############################################################################

# https://github.com/rupa/z
# z, oh how I and Paul Irish love you.
cd
git clone https://github.com/rupa/z.git
chmod +x ~/z/z.sh
# rupa/z can now be installed via `homebrew`, tried but didn't work,
# so sticking with the above for now.
# Also consider moving over your current .z file if possible. it's painful to rebuild :)
# z binary is referenced from .bash_profile

###############################################################################
# Sublime Text Symlink                                                        #
###############################################################################

ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/usr/local/bin/subl

# Had an issue on one machine with this regarding the path:
# https://stackoverflow.com/questions/25152711/subl-command-not-working-command-not-found

###############################################################################
# Photobook -> Dropbox                                                        #
###############################################################################

# Paul Irish's magic photobooth symlink -> dropbox. I love it.
#    + First move Photo Booth folder out of Pictures
#    + Then start Photo Booth. It'll ask where to put the library.
#    + Put it in Dropbox/public
#   * Now… you can record photobooth videos quickly and they upload to dropbox DURING RECORDING
#   * Then you grab public URL and send off your video message in a heartbeat.

###############################################################################
# Extra Stuff to Test / Remove                                                #
###############################################################################

# Other npm -g goodness I like
├── generator-webapp
├── gulp
├── gulp-cli
├── hexo
├── np (A better npm publish)
├── npm
├── prettier
├── yarn
└── yo

# TODO: Look at automating Dock Setup:
# https://github.com/kcrawford/dockutil
# Finder, Kiwi, Spotify,
# 'Space',
# Chrome, Firefox, Safari, Opera, Brave,
# 'Space'
# GitHub Desktop, Sublime Text, Visual Studio Code, iTerm, TextEdit
# 'Space'
# Transmit, Sequel Pro
# 'Space'
# Slack, Tweetbot, Rambox, System Preferences, Sketch, Gyazo GIF, SVG OMG (using https://www.fluidapp.com/)

# zip a folder and set a password.
# I always forget how to do this:
# zip -er archive.zip /path/to/directory/
# TODO: look at a better solution

# https://rvm.io
# rvm for the rubiess
#Paul does: curl -L https://get.rvm.io | bash -s stable --ruby
#I do this one as it adds dependencies as well
#\curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enable

# https://github.com/isaacs/nave
# needs npm, obviously.
# TODO: I think i'd rather curl down the nave.sh, symlink it into /bin and use that for initial node install.
#npm install -g nave

# https://github.com/dronir/SpotifyControl
# Spotify Control Script
#cd ~/code
#git clone git://github.com/dronir/SpotifyControl.git

# https://github.com/jeroenbegyn/VLCControl
# VLC Controll Script
#cd ~/code
#git clone git://github.com/jeroenbegyn/VLCControl.git

# https://ytdl-org.github.io/youtube-dl/download.html
# Download YouTube Videos
#brew install youtube-dl
#youtube-dl <youtube-link>

# Check gems are up to date without installing documentation
#sudo gem update --system --no-document
# Install jekyll
#sudo gem install jekyll

# Disable Updates for Sketch
#defaults write com.bohemiancoding.sketch3.plist SUEnableAutomaticChecks -bool false

# TODO: Add to .osx Sublime Text automation setup
# https://gist.github.com/pbojinov/24316c2a0f5651a347d1
