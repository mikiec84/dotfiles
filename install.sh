cd ~

# create projects folder
if [ ! -e ~/projects ]; then
    mkdir ~/projects
fi


# Configure git
if ( ! git config --global user.email 1>/dev/null ); then
	git config --global user.email "raynos2@gmail.com"
fi

if ( ! git config --global user.name 1>/dev/null ); then
	git config --global user.name "Raynos"
fi

echo ""
echo "Checking rupa/z"

# install z
if [ ! -e ~/projects/z ]; then
	echo " - Fetching rupa/z"
    cd ~/projects
    git clone git@github.com:rupa/z
else
	echo " - Already installed rupa/z"
fi

echo ""
echo "Checking Chrome"

if ( hash google-chrome 2>/dev/null ); then
	echo " - Already installed Chrome"
else
	echo " - Fetching Chrome"
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome*.deb
fi

echo ""
echo "Checking Sublime Text 3"

if ( hash subl 2>/dev/null ); then
	echo " - Already installed Sublime Text 3"
else
	echo " - Fetching Sublime Text 3"
	sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
	sudo apt-get update
	sudo apt-get install -y sublime-text-installer
fi

echo ""
echo "All finished"
