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

targetPrefix=''

if [[ "$OSTYPE" == "darwin"* ]]; then
    targetPrefix='~/Library/Application\ Support/Sublime\ Text\ 3/Packages'
else
    targetPrefix='~/.config/sublime-text-3/Packages'
fi

for file in ${files[@]}; do
    target='$targetPrefix/$file'

    if ([ -e '$target' ] && [ ! -L '$target' ]); then
        rm -rf '$target'
    fi

    if [ ! -L '$target' ]; then
        ln -s ~/dotfiles/sublime/$file '$target'
    fi
done
