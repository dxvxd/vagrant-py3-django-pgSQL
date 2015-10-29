# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |vg_config|
  # Every Vagrant virtual environment requires a box to build off of.
  vg_config.vm.box = "trusty-server-amd64"

  # The URL from where the 'vg_config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  vg_config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Configure virtual machine specs. Keep it simple, single user.
  vg_config.vm.provider :virtualbox do |p|
    p.customize ["modifyvm", :id, "--memory", 1024]
    p.customize ["modifyvm", :id, "--cpus", 2]
    p.customize ["modifyvm", :id, "--cpuexecutioncap", 50]
  end

  # Configure a synced folder between HOST and GUEST
  vg_config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", :mount_options => ["dmode=777","fmode=777"]

  # Config hostname and IP address so entry can be added to HOSTS file
  vg_config.vm.hostname = "project_name.dev"
  vg_config.vm.network :private_network, ip: '192.168.99.100'

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  vg_config.vm.network "forwarded_port", guest: 80, host: 8080
  vg_config.vm.network "forwarded_port", guest: 8000, host: 8001
  vg_config.vm.network "forwarded_port", guest: 6543, host: 6543

  # kickoff a shell script to install Python essentials
  vg_config.vm.provision :shell, path: "vagrant_bootstrap.sh"
end
