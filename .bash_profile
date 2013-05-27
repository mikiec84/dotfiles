# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init z   https://github.com/rupa/z
if [ -e ~/projects/z ]; then
    . ~/projects/z/z.sh
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * Recursive globbing, e.g. `echo **/*.txt`
for option in globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Run nvm so that it's accessible
if [ -e ~/projects/nvm ]; then
    . ~/projects/nvm/nvm.sh
    # Tell nvm to use the latest node 0.8 branch
    nvm use v0.8.23
fi

# {{{
# Hand modified >_<
# Node Completion - Auto-generated, do not touch.
if [ -e ~/.node-completion ]; then
    shopt -s progcomp
    for f in $(command ls ~/.node-completion); do
        f="$HOME/.node-completion/$f"
        test -f "$f" && . "$f"
    done
fi
# }}}
