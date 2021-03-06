# -*- mode: ruby -*-
# vi: set ft=ruby :


VAGRANTFILE_API_VERSION = "2"

cluster = {
  "rancher-server" => { :ip1 => "192.168.157.9", :ip2 => "192.168.197.9", :cpus => 1, :mem => 2048, :script => "deploy_rancher.sh"},
  "kube-master" => { :ip1 => "192.168.157.10", :ip2 => "192.168.197.10", :cpus => 1, :mem => 2048, :script => "deploy.sh"},
  "kube-worker1" => { :ip1 => "192.168.157.11", :ip2 => "192.168.197.11", :cpus => 1, :mem => 2048, :script => "deploy.sh" },
  "kube-worker2" => { :ip1 => "192.168.157.12", :ip2 => "192.168.197.12", :cpus => 1, :mem => 2048, :script => "deploy.sh"}
}


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  cluster.each_with_index do |(hostname, info), index|
  
    config.hostmanager.enabled = true
  
    config.vm.define hostname do |cfg|
      cfg.vm.provider :virtualbox do |vb, override|
        config.vm.box = "ubuntu/bionic64"
        config.vm.synced_folder ".", "/vagrant"
        override.vm.network :private_network, ip: "#{info[:ip1]}"
        override.vm.network :private_network, ip: "#{info[:ip2]}"
        override.vm.hostname = hostname
        vb.name = hostname
        vb.customize ["modifyvm", :id, "--memory", info[:mem], "--cpus", info[:cpus], "--hwvirtex", "on"]
      end # end provider
      cfg.vm.provision :shell, path: info[:script], keep_color: "true"
    end # end config
  end # end cluster
end
