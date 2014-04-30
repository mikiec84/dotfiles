# create projects folder
if [ ! -e ~/projects ]; then
	mkdir ~/projects
fi

if [ ! -e ~/.extra ]; then
	touch ~/.extra
fi

echo ""
echo "Configuring git email & name"

# Configure git
if ( ! git config --global user.email 1>/dev/null ); then
	echo " - Setting global user.email"
	git config --global user.email "raynos2@gmail.com"
fi

if ( ! grep 'git config --global user.email' 1>/dev/null 2>/dev/null ~/.extra ); then
	echo " - Storing global user.email in ~/.extra"
	echo "git config --global user.email 'raynos2@gmail.com'" >> ~/.extra
fi

if ( ! git config --global user.name 1>/dev/null ); then
	echo " - Setting global user.name"
	git config --global user.name "Raynos"
fi

if ( ! grep 'git config --global user.name' 1>/dev/null 2>/dev/null ~/.extra ); then
	echo " - Storing global user.name in ~/.extra"
	echo "git config --global user.name 'Raynos'" >> ~/.extra
fi


echo ""
echo "Checking curl"


if ( hash curl 2>/dev/null ); then
	echo " - Already installed curl"
else
	echo " - Fetching curl"
	sudo apt-get install curl
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
echo "Checking creationix/nvm"

if [ ! -e ~/projects/nvm ]; then
	echo " - Fetching creationix/nvm"
	cd ~/projects
	git clone git@github.com:creationix/nvm
	. ./nvm/nvm.sh
else
	echo " - Already installed creationix/nvm"
fi

echo ""
echo "Checking node@0.10.26"

if [ "$(node -v 2>/dev/null)" != "v0.10.26" ]; then
	echo " - Fetching node@0.10.26"
	. ~/projects/nvm/nvm.sh
	nvm install v0.10.26
	nvm use v0.10.26
else
	echo " - Already installed node@0.10.26";
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
echo "Checking terminator"

if ( hash terminator 2>/dev/null ); then
	echo " - Already installed Terminator"
else
	echo " - Fetching terminator"
	sudo apt-get install terminator
fi

echo ""
echo "Checking pygmentize"

if ( hash pygmentize 2>/dev/null ); then
	echo " - Already installed pygmentize"
else
	echo " - Fetching pygmentize"
	sudo apt-get install python-pygments
fi

echo ""
echo "All finished"
