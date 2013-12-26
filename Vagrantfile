# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "[BASE BOX NAME]" #ruby-1.9.3-mysql
  config.vm.provision :shell, :path => "[PATH TO SHELL FILE]"
  # config.vm.network :forwarded_port, host: 3000, guest: 3000
  # config.vm.network :forwarded_port, host: 3306, guest: 3306
end
