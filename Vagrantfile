# Vagrantfile
Vagrant.configure("2") do |config|
  
  # MÁQUINA SERVIDOR (mirror.sistema.sol)
  config.vm.define "server" do |srv|
    srv.vm.box = "debian/bookworm64"
    srv.vm.hostname = "mirror.sistema.sol"
    
    # Red Pública (Bridge)
    srv.vm.network "public_network"

    # Red Privada (IP Fija)
    srv.vm.network "private_network", ip: "192.168.56.10"

    # Ansible
    srv.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "ansible/playbook.yml"
      ansible.install_mode = "default"
    end
  end

  # MÁQUINA CLIENTE
  config.vm.define "client" do |cli|
    cli.vm.box = "debian/bookworm64"
    cli.vm.hostname = "client"
    
    # Red Pública
    cli.vm.network "public_network"
    # Red Privada
    cli.vm.network "private_network", ip: "192.168.56.11"

    # Script de herramientas
    cli.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y lftp ftp nmap net-tools dnsutils
      echo "nameserver 192.168.56.10" > /etc/resolv.conf
      echo "Cliente listo. DNS apuntando al servidor FTP."
    SHELL
  end
end