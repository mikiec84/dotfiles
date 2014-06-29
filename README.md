# Raynos dotfiles

## Installation

### Clone

```sh
cd ~/projects
git clone git@github.com:Raynos/dotfiles
```

### Fresh Clone

This will run the `init.sh` script in `bash`
which will set up a fresh ubuntu 14.04 machine
that doesn't have a copy of git installed yet.

```sh
wget -q -O - https://raw.githubusercontent.com/Raynos/dotfiles/master/init.sh 2>&1 | bash
# Add keys to github when prompted.
wget -q -O - https://raw.githubusercontent.com/Raynos/dotfiles/master/init.sh 2>&1 | bash
```

### Install (optional)

**UBUNTU ONLY**

If your running ubuntu you can run

```sh
bash install.sh
```

to install all the dependencies

### Ubuntu setup (optional)

**UBUNTU ONLY**

If your running ubunt you can run

```sh
bash ubuntu.sh
```

To configure the unity GUI with better
UI defaults

### Bootstrap

To copy all the files from `~/projects/dotfiles` into `~`

```sh
source bootstrap.sh
```

## Thanks to…

 * Mathias Bynens for his dotfiles!
