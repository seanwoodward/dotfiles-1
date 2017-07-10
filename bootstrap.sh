#!/usr/bin/env bash

#cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
    --exclude ".editorconfig" \
    --exclude ".gitignore" \
    --exclude ".gvimrc" \
    --exclude ".hgignore" \
    --exclude ".inputrc" \
    --exclude ".osx" \
    --exclude ".screenrc" \
    --exclude ".tmux.conf" \
    --exclude ".wgetrc" \
    --exclude "LICENSE-MIT.txt" \
    --exclude "README.md" \
    --exclude "bin" \
    --exclude "brew.sh" \
    --exclude "init/Preferences.sublime-settings"

    -avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
