# Set the launcher to auto hide
dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode 1;

# Set the number of workspace to 4x4
dconf write /org/compiz/profiles/unity/plugins/core/vsize 4;
dconf write /org/compiz/profiles/unity/plugins/core/hsize 4;

# Set ubuntu tree wallpaper as background
dconf write /org/gnome/desktop/background/picture-uri "'file:///home/raynos/projects/dotfiles/ubuntu-wallpaper.jpg'";
