
Vagrant.configure("2") do |config|

#This line is used to define the version of vagrant 

	config.vm.define "Kube-Master" do |master|
	
	#Used to define the name of the VM on Vagrant
	#vmbox used to define the box from vagrant repo
	#hostname used to define the hostname of the VM on VirtualBox and in "/etc/hosts" of the VM
	#provider used to set the VMs specs for VirtualBox
	
		master.vm.box = "ubuntu/focal64"
		master.vm.hostname = "Kube-Master"
		master.vm.network :private_network, :ip => '10.0.0.254'
		master.vm.provider "virtualbox" do |v|
			v.name = "Kube-Master"
			v.memory = 2048
			v.cpus = 2
		end
		master.vm.provision "shell", inline: "ip --br a"		
		master.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/apt_upgrade.sh"
		master.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/checkPkg.sh"
		master.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/apply_k8s_modules.sh"
		master.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/mod_sysctl_params.sh"
		master.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/install_packages.sh"
		master.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/config_cri.sh"
		master.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/mod_fw.sh"
		master.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/master_init.sh"
		master.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/cluster_init.sh"
	end
	
	N = 2
	
	(1..N).each do |i|

#	#Loop from 1 to 2 and do the following
		
		config.vm.define "Kube-Slave-#{i}" do |slave|
			slave.vm.box = "ubuntu/focal64"
			# the increment is to offset the hostonly ip that will be assigned on the host machine which will start from 1
			slave.vm.network "private_network", ip: "10.0.0.#{1+i}"
			slave.vm.hostname = "Kube-Slave-#{i}"
			slave.vm.provider "virtualbox" do |v|
				v.name = "Kube-Slave-#{i}"
				v.memory = 1024
				v.cpus = 1
			end
			slave.vm.provision "shell", inline: "ip --br a"		
			slave.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/apt_upgrade.sh"
			slave.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/checkPkg.sh"
			slave.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/apply_k8s_modules.sh"
			slave.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/mod_sysctl_params.sh"
			slave.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/install_packages.sh"
			slave.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/config_cri.sh"
			slave.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/mod_fw.sh"
			slave.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/worker_init.sh"
			slave.vm.provision "shell", path: "https://raw.githubusercontent.com/8bawi/kuberant/main/lib/worker_join.sh"
			
		end
	end  

  

end
