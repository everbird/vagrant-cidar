Vagrant::Config.run do |config|
  config.vm.box = "everbird-gentoo-64"
  config.vm.provision :puppet, :module_path => "modules" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "dev.pp"
  end

  config.vm.forward_port 22, 2223
  # Setting host name is currently only supported on Debian, Ubuntu and RedHat.
  #config.vm.host_name = "cidar"

  config.vm.customize [
    'modifyvm', :id,
    '--name', 'vagrant-cidar',
    '--memory', '1536',
  ]
end
