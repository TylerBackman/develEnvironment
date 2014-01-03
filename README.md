develEnvironment
================

cheminformatics development container

# Install Instructions
Install vagrant
	http://www.vagrantup.com/downloads.html
Install virtualbox
	https://www.virtualbox.org/wiki/Downloads
Download box
	vagrant box add debianWheezy64 http://puppet-vagrant-boxes.puppetlabs.com/debian-70rc1-x64-vbox4210.box

# Running and logging into Container
vagrant up
vagrant ssh

# destroying container (commit code first!)
vagrant destroy

# reprovisioning
vagrant up --provision

# creating a vagrant box from the dist
vagrant halt
vagrant develEnvironment --base vm_name_from_virtualbox
