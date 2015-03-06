#!/usr/bin/env bash

# root su yourself
sudo su

export DEBIAN_FRONTEND=noninteractive

# way of checking if you we need to install everything
if [ ! -e "/var/strongnode-app-folder" ]; then
    # Add mongo to apt
    apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 &> /dev/null
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' \
		> /etc/apt/sources.list.d/mongodb.list

    # Update and begin installing some utilities and the latest stable of mongo
	echo "Updating apt..."
    apt-get update > /dev/null

	echo "Installing dev tools.."
    apt-get install -y vim git curl build-essential &> /dev/null

	echo "Installing mongodb..."
	apt-get install -y mongodb-org &> /dev/null

	# Install Node
	echo "Installing node..."
	mkdir -p /usr/local/src/node /usr/local/etc
	curl -s http://nodejs.org/dist/v0.10.36/node-v0.10.36-linux-x64.tar.gz \
		| tar -xz -C /usr/local --strip-components 1 -f -
	curl -s http://nodejs.org/dist/v0.10.36/node-v0.10.36.tar.gz \
		| tar -xz -C /usr/local/src/node --strip-components 1 -f -
	echo "nodedir = /usr/local/src/node" > /usr/local/etc/npmrc

	# Install StrongLoop
	echo "Installing strongloop..."
	npm install -g strongloop > /dev/null
	echo "done."

	# Symlink our host node-apps to the guest /var/node-apps folder
	ln -s /vagrant/strongnode-app-folder /var/strongnode-app-folder

	echo "You can place other node apps in gthe /strongnode-app-folder/ and find them at /var/strongnode-app-folder/"
	echo " 'slc run /var/strongnode-app-folder/myApp/app.js' to run the strong node node app in strongnode-app-folder/myApp"

	sudo apt-get install git git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

	cd
	git clone git://github.com/sstephenson/rbenv.git .rbenv
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc
	exec $SHELL

	git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
	exec $SHELL

	git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

	rbenv install 2.2.1
	rbenv global 2.2.1
	ruby -v

	wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

fi
