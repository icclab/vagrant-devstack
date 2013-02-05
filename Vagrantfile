# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.define :devstack do |devstack_config|
    devstack_config.vm.box = "precise64"
    devstack_config.vm.boot_mode = :gui
    #devstack_config.vm.network  :hostonly, "10.1.2.44" #:hostonly or :bridged - default is NAT
    devstack_config.ssh.max_tries = 100
    devstack_config.vm.host_name = "devstack"
    devstack_config.vm.forward_port 80, 8080 #dashboard
    devstack_config.vm.forward_port 22, 2222 #ssh
    devstack_config.vm.forward_port 5000, 5000 #keystone
    # devstack_config.vm.share_folder "v-data", "/vagrant_data", "../data"
    devstack_config.vm.provision :puppet do |devstack_puppet|
      devstack_puppet.pp_path = "/tmp/vagrant-puppet"
      devstack_puppet.module_path = "modules"
      devstack_puppet.manifests_path = "manifests"
      devstack_puppet.manifest_file = "site.pp"
    end
  end
end