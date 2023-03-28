Vagrant.configure("2") do |config|
  config.vm.define :sonarqube do |sonarqube|
    sonarqube.vm.box = "centos/7"
    sonarqube.vm.hostname = "sonarqube"
    sonarqube.vm.network "forwarded_port", guest: 9000, host: 9000, host_ip: "127.0.0.1"
    sonarqube.vm.network "private_network", ip: "192.168.1.6"
    sonarqube.vm.provision 'shell', path: 'provision.sh'
    sonarqube.vm.provider "libvirt" do |libvirt|
      libvirt.cpus = "2"
      libvirt.memory = "1024"
      libvirt.default_prefix = ""
    end
  end
end