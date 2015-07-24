# create projects folder
set -e
set -x

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
    read -p "Please enter email: " email
    git config --global user.email "$email"
fi

if ( ! grep 'git config --global user.email' 1>/dev/null 2>/dev/null ~/.extra ); then
    echo " - Storing global user.email in ~/.extra"
    echo "git config --global user.email '$email'" >> ~/.extra
fi

if ( ! git config --global user.name 1>/dev/null ); then
    echo " - Setting global user.name"
    read -p "Please enter username: " username
    git config --global user.name "$username"
fi

if ( ! grep 'git config --global user.name' 1>/dev/null 2>/dev/null ~/.extra ); then
    echo " - Storing global user.name in ~/.extra"
    echo "git config --global user.name '$username'" >> ~/.extra
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
echo "Checking node@0.10.32"

if [ "$(node -v 2>/dev/null)" != "v0.10.32" ]; then
    echo " - Fetching node@0.10.32"
    . ~/projects/nvm/nvm.sh
    nvm install v0.10.32
    nvm use v0.10.32
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
echo "Checking go"

if ( hash go 2>/dev/null ); then
    echo " - Already installed go"
else
    echo " - Fetching go"
    cd ~/projects
    wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.4.2.linux-amd64.tar.gz
fi

echo ""
echo "Checking github/hub"

if ( hash hub 2>/dev/null ); then
   echo " - Already installed github/hub"
else
   echo " - Fetching hub"
   cd ~/projects
   git clone git://github.com/github/hub.git
   cd hub
   ./script/build
   cp hub ~/bin/hub
fi

echo ""
echo "Checking g++"

if ( hash g++ 2>/dev/null ); then
    echo " - Already installed g++"
else 
    echo " - Fetching g++"
    sudo apt-get install g++
fi

echo ""
echo "Install node"

if ( which /usr/local/bin/node 1>/dev/null ); then
    echo " - Already installed node"
else
    echo " - Fetching node"
    cd ~/projects
    wget "http://nodejs.org/dist/v0.10.28/node-v0.10.28.tar.gz"
    tar -zxvf node-v0.10.28.tar.gz
    cd node-v0.10.28
    ./configure
    make -j 5
    sudo make install
    cd ..
    rm node-v0.10.28.tar.gz
fi

echo ""
echo "Checking npm@2.7.4"

if ( hash npm 2>/dev/null ); then
    if ( npm -v | grep "2.7.4" 1>/dev/null ); then
        echo " - Already installed npm"
    else
        npm i npm@2.7.4 -g
    fi
else
    echo "npm is needed to npm install npm"
    exit 1
fi

echo ""
echo "Checking nano"

function __install_nano() {
    echo " - Fetching nano"
    sudo apt-get install libncurses5-dev
    cd ~/projects
    wget "http://www.nano-editor.org/dist/v2.3/nano-2.3.2.tar.gz"
    tar -zxvf nano-2.3.2.tar.gz
    cd nano-2.3.2
    ./configure
    make
    sudo make install
    cd ..
    rm nano-2.3.2.tar.gz
}

if ( hash nano 2>/dev/null ); then
    if ( nano -V | grep "2.3.2" 1>/dev/null ); then
        echo " - Already installed nano"
    else 
        __install_nano
    fi
else
    __install_nano
fi

echo ""
echo "Install sublime package control"

if [ ! -e ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package ]; then
    echo  " - Fetching sublime package control"
    if [ ! -e ~/.config/sublime-text-3/Installed\ Packages ]; then
        mkdir ~/.config/sublime-text-3/Installed\ Packages
    fi    

    cd ~/.config/sublime-text-3/Installed\ Packages
    wget "https://sublime.wbond.net/Package%20Control.sublime-package"
else 
    echo " - Already installed sublime package control"
fi

echo ""
echo "Sourching bootstrap.sh"

source ~/projects/dotfiles/bootstrap.sh

echo ""
echo "All finished"
