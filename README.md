# A Virtual Machine for Python Related Development on Gentoo

## Introduction

This project automates the setup of a development environment for python related development on [gentoo](http://www.gentoo.org/) which I prefered. You can customized the `Vagrantfile` on your fork. This is the easiest way to build a box with everything ready to start hacking, all in an isolated virtual machine.

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

## How To Build The Virtual Machine

#### 1. Download the .box file from [here](http://dl.dropbox.com/u/1212791/everbird-gentoo-64-i686-3.3.8.box) which I prepared at first. It's about 0.96G.

	➜  boxes  wget http://dl.dropbox.com/u/1212791/everbird-gentoo-64-i686-3.3.8.box

#### 2. Add it to vagrant boxes:

	➜  boxes  vagrant box add everbird-gentoo-64-i686-3.3.8 everbird-gentoo-64-i686-3.3.8.box
	[vagrant] Downloading with Vagrant::Downloaders::File...
	[vagrant] Copying box to temporary location...
	[vagrant] Extracting box...
	[vagrant] Verifying box...
	[vagrant] Cleaning up downloaded box...	
	➜  boxes  vagrant box list
	everbird-gentoo-64-i686-3.3.8

#### 3. Build the virtual machine:

	➜  vagrant  git clone --recursive git://github.com/everbird/vagrant-cidar.git
	Cloning into 'vagrant-cidar'...
	remote: Counting objects: 69, done.
	remote: Compressing objects: 100% (33/33), done.
	remote: Total 69 (delta 21), reused 64 (delta 16)
	Receiving objects: 100% (69/69), 6.31 KiB, done.
	Resolving deltas: 100% (21/21), done.
	Submodule 'modules/concat' (git://github.com/ripienaar/puppet-concat.git) registered for path 'modules/concat'
	Submodule 'modules/gentoo' (git://github.com/ramereth/puppet-gentoo.git) registered for path 'modules/gentoo'
	Cloning into 'modules/concat'...
	remote: Counting objects: 247, done.
	remote: Compressing objects: 100% (169/169), done.
	remote: Total 247 (delta 103), reused 207 (delta 67)
	Receiving objects: 100% (247/247), 40.68 KiB | 36 KiB/s, done.
	Resolving deltas: 100% (103/103), done.
	Submodule path 'modules/concat': checked out '00259779effdd210b7ad7b3e35551ddadd37116e'
	Cloning into 'modules/gentoo'...
	remote: Counting objects: 387, done.
	remote: Compressing objects: 100% (176/176), done.
	remote: Total 387 (delta 146), reused 383 (delta 142)
	Receiving objects: 100% (387/387), 46.70 KiB | 35 KiB/s, done.
	Resolving deltas: 100% (146/146), done.
	Submodule path 'modules/gentoo': checked out '60276050986a9d6e14da3aa10336c1e17dba0f94'
	➜  vagrant  cd vagrant-cidar
	➜  vagrant-cidar git:(master) vagrant up

That's it.

The setup itself takes about 11-13 minutes in my MacBook Pro. 

	[default] Importing base box 'everbird-gentoo-64-i686-3.3.8'...
	[default] Matching MAC address for NAT networking...
	[default] Clearing any previously set forwarded ports...
	[default] Forwarding ports...
	[default] -- 22 => 2223 (adapter 1)
	[vagrant] Pruning invalid NFS exports. Administrator privileges will be required...
	[default] Exporting NFS shared folders...
	[vagrant] Preparing to edit /etc/exports. Administrator privileges will be required...
	[default] Creating shared folders metadata...
	[default] Clearing any previously set network interfaces...
	[default] Preparing network interfaces based on configuration...
	[default] Running any VM customizations...
	[default] Booting VM...
	[default] Waiting for VM to boot. This can take a few minutes.
	[default] VM booted and ready for use!
	[default] Configuring and enabling network interfaces...
	[default] Mounting shared folders...
	[default] -- manifests: /tmp/vagrant-puppet/manifests
	[default] -- v-pp-m0: /tmp/vagrant-puppet/modules-0
	[default] Mounting NFS shared folders...
	[default] Running provisioner: Vagrant::Provisioners::Puppet...
	[default] Running Puppet with /tmp/vagrant-puppet/manifests/dev.pp...
	warning: Could not retrieve fact fqdn
	notice: /Stage[main]/Vagrant/File[/etc/motd]/ensure: defined content as '{md5}42e6a4667e59045d30433b5f4dde5d00'
	notice: /Stage[main]/Local_repo/Exec[sync-gentoo-portages]/returns: executed successfully
	notice: /Stage[main]/Infrastructure/Package[app-misc/tmux]/ensure: created
	notice: /Stage[main]/Local_repo/Exec[eix-update]/returns: executed successfully
	notice: /Stage[main]/Python/Package[dev-python/pip]/ensure: created
	notice: /Stage[main]/Python/Package_keywords[dev-python/virtualenvwrapper]/ensure: created
	notice: /Stage[main]/Python/Package[dev-python/ipython]/ensure: created
	notice: /Stage[main]/Python/Package[dev-python/virtualenv]/ensure: created
	notice: /Stage[main]/Python/File[/etc/portage/package.keywords/puppet]/mode: mode changed '0600' to '0644'
	notice: /Stage[main]/Python/Package[dev-python/virtualenvwrapper]/ensure: created
	notice: /Stage[main]/Timezone/File[timezone]/ensure: created
	notice: /Stage[main]/Timezone/Exec[set-timezone]: Triggered 'refresh' from 1 events
	notice: Finished catalog run in 446.15 seconds

After the installation has finished, you can access the virtual machine with

	➜  vagrant-cidar git:(master) vagrant ssh
	Last login: Sat Sep  1 17:20:18 CST 2012 from 10.0.2.2 on ssh
   		Remember, there are not stupid questions, just stupid people.
                                            - Herbert Garrison
	vagrant@cidar ~ $ 
	
Port 2223 in the host computer is forwarded to port 22 in the virtual machine. Ip of the vm was set to `10.0.3.20`. You can ssh to vm either way. 

As we use [NFS Shared Folders](http://vagrantup.com/v1/docs/nfs.html) by default, vagrant need authorization to change /etc/exports to mount. A better way is grant vagrant sudo-access without password for NFS-setup. A handy script is available [here](https://gist.github.com/2864683).

## What's In The Box

### Generally:
* Python 2.7.3 & 3.2.3
* Ruby 1.8.7 & 1.9.3
* Puppet
* Vim 7.3 (+python +ruby)
* Git
* Virtualbox Guest Additions 4.1.20
* Sqlite3, Mysql
* Redis, Memcached
* Nginx
* Virtualenv, VirtualenvWrapper
* zsh, tmux, ack, openntpd, mlocate, zerofree
* eix, gentoolkit


### Details:
see [Packages In The Box](https://github.com/everbird/vagrant-cidar/wiki/Packages-In-The-Box) page.


## Virtual Machine Management

When done just log out with `^D` and suspend the virtual machine

    host $ vagrant suspend

then, resume to hack again

    host $ vagrant resume

Run

    host $ vagrant halt

to shutdown the virtual machine, and

    host $ vagrant up

to boot it again.

You can find out the state of a virtual machine anytime by invoking

    host $ vagrant status

Finally, to completely wipe the virtual machine from the disk **destroying all its contents**:

    host $ vagrant destroy # DANGER: all is gone

Please check the [Vagrant documentation](http://vagrantup.com/v1/docs/index.html) for more information on Vagrant.
