# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  
  config.vm.define "frontend" do |frontend|
  
    frontend.vm.box = "hashicorp/bionic64"
    frontend.vm.hostname = "frontend"
    frontend.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end

    frontend.vm.network "private_network", ip: "192.168.33.10"
    
    frontend.vm.provision "A", type: "ansible_local" do |ansible|
      ansible.playbook = "frontend.yml"
    end

    frontend.vm.provision "B",after: "A", type: "ansible_local" do |ansible|
      ansible.playbook = "d-frontend.yml"
    end
    
  end
 

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
