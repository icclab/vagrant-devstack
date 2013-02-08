# -*- mode: ruby -*-
# vi: set ft=ruby :

# Copyright 2013 Zürcher Hochschule für Angewandte Wissenschaften
# All Rights Reserved.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

Vagrant::Config.run do |config|

  config.vm.define :devstack do |devstack_config|

    devstack_config.vm.box = "precise64"
    devstack_config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    # devstack_config.vm.boot_mode = :gui
    # devstack_config.vm.network  :hostonly, "10.1.2.44" #:hostonly or :bridged - default is NAT
    devstack_config.vm.host_name = "devstack"
    devstack_config.vm.customize ["modifyvm", :id, "--memory", 1024]
    devstack_config.ssh.max_tries = 100
    devstack_config.vm.forward_port 80, 8080

    devstack_config.vm.provision :puppet do |devstack_puppet|
      devstack_puppet.pp_path = "/tmp/vagrant-puppet"
      devstack_puppet.module_path = "modules"
      devstack_puppet.manifests_path = "manifests"
      devstack_puppet.manifest_file = "site.pp"
    end
  end
end