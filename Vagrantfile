# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  
  config.vm.define "login" do |login|
  
    login.vm.box = "hashicorp/bionic64"
    login.vm.hostname = "login"
    
    login.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
    
    
    login.vm.network "private_network", ip: "192.168.33.11"

    login.vm.provision "A", type: "ansible_local" do |ansible|
      ansible.playbook = "login.yml"
    end
    login.vm.provision "B", after: "A", type: "shell", path: "go.sh"
    
    login.vm.provision "C", after: "B", type: "ansible_local" do |ansible|
      ansible.playbook = "d-login.yml"
    end

  end 



end
