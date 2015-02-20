Vagrant.configure("2") do |config|
  config.vm.box = "everbird/cidar-2"
  config.vm.provision :puppet, :module_path => "modules" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "dev.pp"
  end

  config.vm.network "private_network", ip: "10.0.3.20", auto_config: false

  # config.vm.synced_folder ".", "/vagrant", type: "nfs"
  # config.vm.synced_folder "/Users/everbird/code", "/home/everbird/code", type: "nfs"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "/Users/everbird/code", "/home/everbird/code"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant-cidar"
    vb.customize [
      'modifyvm', :id,
      '--memory', '512',
    ]
  end
end
