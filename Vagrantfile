Vagrant.configure("2") do |config|
  config.vm.box = "everbird-gentoo-64-i686-3.3.8"
  config.vm.provision :puppet, :module_path => "modules" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "dev.pp"
  end

  config.vm.network :private_network, ip: "10.0.3.20"

  config.vm.synced_folder ".", "/vagrant", :nfs => true
  config.vm.synced_folder "/Users/everbird/code", "/home/everbird/code", :nfs => true

  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant-cidar"
    vb.customize [
      'modifyvm', :id,
      '--memory', '512',
    ]
  end
end
