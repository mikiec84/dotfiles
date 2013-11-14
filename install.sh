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
files=(User JavaScriptNext SublimeLinter DotFilesSyntaxHighlighting)

for file in ${files[@]}; do
    target=~/.config/sublime-text-3/Packages/$file

    if ([ -e $target ] && [ ! -L $target ]); then
        rm -rf $target
    fi

    if [ ! -L $target ]; then
        ln -s ~/dotfiles/sublime/$file $target
    fi
done
