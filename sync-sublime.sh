SRC="$HOME/.config/sublime-text-3"
DST="./.config/sublime-text-3"

cp $SRC/sublime-projects/*.sublime-project \
    $DST/sublime-projects

cp $SRC/Packages/User/Preferences.sublime-settings \
    $DST/Packages/User/Preferences.sublime-settings

cp $SRC/Packages/User/Package\ Control.sublime-settings \
    $DST/Packages/User/Package\ Control.sublime-settings
