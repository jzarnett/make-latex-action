#!/bin/sh

set -e

working_directory="$1"
extra_system_packages="$2"
pushback="$3"

if [ -n "$extra_system_packages" ]; then
  apt-get update
  for pkg in $extra_system_packages; do
    echo "Install $pkg by apt"
    apt-get -y install "$pkg"
  done
fi

if [ -n "$working_directory" ]; then
  cd "$working_directory"
fi

make

if [ "$pushback" = true ] ; then
	rm -rf compiled
        mkdir compiled
        mv *.pdf compiled/
	git config --global --add safe.directory /github/workspace
	git config --global user.name "github-actions[bot] on behalf of Jeff Zarnett"
	git config --global user.email "jzarnett@gmail.com"
        echo "!*.pdf" > compiled/.gitignore
	git add compiled/.gitignore
        git add compiled
	git commit -m "auto-compile" && git pull && git push || true
fi

