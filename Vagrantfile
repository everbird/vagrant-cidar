Vagrant::Config.run do |config|
  config.vm.box = "everbird-gentoo-64-i686-3.3.8"
  config.vm.provision :puppet, :module_path => "modules" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "dev.pp"
  end

  config.vm.forward_port 22, 2223
  config.vm.network :hostonly, "10.0.3.20 "

  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  config.vm.share_folder("workspace", "/home/everbird/code", "/Users/everbird/code", :nfs => true)

  config.vm.customize [
    'modifyvm', :id,
    '--name', 'vagrant-cidar',
    '--memory', '512',
  ]
end
