# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

if File.directory?('.git')
  abort('Git checkouts are deprecated')
end

#Vagrant.require_version ">= 1.5.0"
if `vagrant --version` < 'Vagrant 1.5.0'
    abort('Your Vagrant is too old. Please install at least 1.5.0')
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "lcn/debian-wheezy-64"
  config.vm.hostname = 'vip.local'
  config.vm.network :private_network, ip: "10.86.73.80"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  config.vm.provider "vmware_fusion" do |v|
    v.memory = 1024
  end

  config.vm.synced_folder "vip", "/srv/vip", owner: 'www-data', group: 'www-data'

  # Provision everything we need with Puppet
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "init.pp"
    puppet.options = ['--templatedir', '/srv/puppet/files']
    puppet.facter = {
      "quickstart_domain" => 'vip.local',
    }
  end

end
