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
 

  config.vm.define "backend" do |backend|
  
    backend.vm.box = "hashicorp/bionic64"
    backend.vm.hostname = "backend"
    
    backend.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
    
    
    backend.vm.network "private_network", ip: "192.168.33.11"
    backend.vm.network "forwarded_port", guest: 6379, host: 6379, host_ip: "192.168.33.12"
    backend.vm.provision "A", type: "ansible_local" do |ansible|
      ansible.playbook = "backend.yml"
    end
    backend.vm.provision "B", after: "A", type: "shell", path: "go.sh"
    
    backend.vm.provision "C", after: "B", type: "ansible_local" do |ansible|
      ansible.playbook = "d-backend.yml"
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

    # database.vm.provision "B",after:"A", type: "ansible_local" do |ansible|
    #   ansible.playbook = "d-database.yml"
    # end

  end
 
end
