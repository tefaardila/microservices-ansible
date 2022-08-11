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
 

  config.vm.define "databaseend" do |databaseend|
  
    databaseend.vm.box = "hashicorp/bionic64"
    databaseend.vm.hostname = "databaseend"
    
    databaseend.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
    
    
    databaseend.vm.network "private_network", ip: "192.168.33.11"

    databaseend.vm.provision "A", type: "ansible_local" do |ansible|
      ansible.playbook = "databaseend.yml"
    end
    databaseend.vm.provision "B", after: "A", type: "shell", path: "go.sh"
    
    databaseend.vm.provision "C", after: "B", type: "ansible_local" do |ansible|
      ansible.playbook = "d-databaseend.yml"
    end

  end 




  config.vm.define "database" do |database|
  
    database.vm.box = "hashicorp/bionic64"
    database.vm.hostname = "database"
    database.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end

    database.vm.network "private_network", ip: "192.168.33.12"
       
    database.vm.provision "A", type: "ansible_local" do |ansible|
      ansible.playbook = "database.yml"
    end

    database.vm.provision "B",after:"A", type: "ansible_local" do |ansible|
      ansible.playbook = "d-database.yml"
    end

  end
 
end
