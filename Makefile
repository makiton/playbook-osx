all: setup install

setup:
	ruby -e "$$(curl -fsSL https://raw.github.com/Homebrew/install/master/install)"
	brew install ansible
	mkdir -p /usr/local/etc/ansible
	echo "localhost" > /usr/local/etc/ansible/hosts

install: install-dein run-ansible

install-dein:
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/dein-installer.sh
	sh /tmp/dein-installer.sh ~/.cache/dein/

run-ansible:
	ansible-playbook -K localhost.yml
