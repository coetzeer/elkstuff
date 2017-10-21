# -*- mode: ruby -*-
# vi: set ft=ruby :

cluster = {
  "server1" => { :ip => "192.168.33.10", :cpus => 1, :mem => 4096 },
  "server2" => { :ip => "192.168.33.11", :cpus => 1, :mem => 4096 },
  "server3" => { :ip => "192.168.33.12", :cpus => 1, :mem => 4096 }
}

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
# Vagrant.configure(2) do |config|
#   config.vm.box = "coetzeer/centos7-ansible"
#   config.vm.box_check_update = true
#   config.vm.network "forwarded_port", guest: 5601, host: 5602
#   config.vm.network "private_network", ip: "192.168.33.11"
#   config.vm.provider "virtualbox" do |vb|
#     vb.gui = false
#     vb.memory = "2048"
#   end
#
#   config.vm.provision "shell", inline: <<-SHELL
#     sudo bash /vagrant/provision.sh
#   SHELL
#
#   config.vm.synced_folder ".", "/vagrant", type: "rsync",rsync__exclude: [".git/","*.vdi"]
#
# end

Vagrant.configure(2) do |config|

  cluster.each_with_index do |(hostname, info), index|

    config.vm.define hostname do |cfg|
      cfg.vm.provider :virtualbox do |vb, override|
        #config.vm.box = "centos/7"
        config.vm.box_check_update = true
        config.vm.box = "centos/7-with-extras"
        config.vm.box_url = "/Users/raymondcoetzee/git/packer-templates-1/CentOS-7-x86_64/CentOS-7-x86_64-virtualbox.box"
        override.vm.network :private_network, ip: "#{info[:ip]}"
        config.vm.network "forwarded_port", guest: 5601, host: 5601, auto_correct: true
        override.vm.hostname = hostname
        vb.name = hostname
        vb.customize ["modifyvm", :id, "--memory", info[:mem], "--cpus", info[:cpus], "--hwvirtex", "on"]
      end # end provider
    end # end config

    config.vm.provision "shell", inline: <<-SHELL
      sudo bash /vagrant/provision.sh
    SHELL

    #config.vm.synced_folder ".", "/vagrant", type: "rsync",rsync_exclude: [".git/","*.vdi"]

  end # end cluster
end
