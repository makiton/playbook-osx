all: setup install

setup:
	ruby -e "$$(curl -fsSL https://raw.github.com/Homebrew/install/master/install)"
	brew install ansible
	mkdir -p /usr/local/etc/ansible
	echo "localhost" > /usr/local/etc/ansible/hosts
install:
	ansible-playbook -K localhost.yml
