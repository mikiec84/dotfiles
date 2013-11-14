cd ~

# create projects folder
if [ ! -e ~/projects ]; then
    mkdir ~/projects
fi

# install z
if [ ! -e ~/projects/z ]; then
    cd ~/projects
    git clone git@github.com:rupa/z
fi

# Initialize sublime settings
ln -s ~/dotfiles/sublime/User ~/.config/sublime-text-3/Packages/User
ln -s ~/dotfiles/sublime/JavaScriptNext ~/.config/sublime-text-3/Packages/JavaScriptNext
ln -s ~/dotfiles/sublime/SublimeLinter ~/.config/sublime-text-3/Packages/SublimeLinter
