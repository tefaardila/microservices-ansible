# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  

  config.vm.define "back" do |back|
  
    back.vm.box = "hashicorp/bionic64"
    back.vm.hostname = "back"
    back.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end

    back.vm.network "private_network", ip: "192.168.33.12"
       
    back.vm.provision "A", type: "ansible_local" do |ansible|
      ansible.playbook = "back.yml"
    end

    back.vm.provision "B",after:"A", type: "ansible_local" do |ansible|
      ansible.playbook = "d-back.yml"
    end

  end


end
