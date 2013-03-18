# Automate Your Devstack!

This project will allow you automate the creation of a VM with [devstack](http://www.devstack.org) installed and running. It uses vagrant to create the VM and puppet to configure the VM so all required software is installed and running.

## Prereqs

* Install [VirtualBox](http://virtualbox.org). **Note:** *this has not been tested on the latest vagrant 1.1.0*
* Install [vagrant](http://vagrantup.com)
* Optionally, but it's a good idea, install the vagrant virtualbox [guest additions plugin](https://github.com/dotless-de/vagrant-vbguest) and also [the hostmaster plugin](https://github.com/mosaicxm/vagrant-hostmaster)
* You should have the vagrant project supplied `precise64` box installed. If you don't then execute this: `vagrant box add precise64 http://files.vagrantup.com/precise64.box`

## Install
* Clone this repository! :-)
* `cd vagrant-devstack`
* `git submodule init`
* `git submodule update`
* `vagrant up`

The initial install takes time so go do something useful or have a coffee! :-) When it's done, you should be able to reach the OpenStack dashboard from [http://10.1.2.44](http://10.1.2.44). If you use the hostmaster plugin then access via [http://devstack.local](http://devstack.local). If you wish to ssh to the OpenStack virtual box execute `vagrant ssh`.

## Notes
1. If you wish to enable **Heat** then add to the `$localrc_cnt` variable (in `manifests/site.pp`) the following:

	`ENABLED_SERVICES+=,heat,h-api,h-api-cfn,h-api-cw,h-eng`

2. If you wish to enable **Ceilometer** then add to the `$localrc_cnt` variable (in `manifests/site.pp`) the following:

	`enable_service ceilometer-acompute,ceilometer-acentral,ceilometer-collector,ceilometer-api`  
	`EXTRA_OPTS=(notification_driver=nova.openstack.common.notifier.rabbit_notifier,ceilometer.compute.nova_notifier)`

3. Currently the VM is allocated 1024MB of RAM. You will only be able to create 1 VM. Suggestion is to either increase the RAM allocation (edit `Vagrantfile`) or create some new OpenStack flavors with less RAM (the smallest default is 512MB) e.g.:

	`nova-manage flavor create --name=itsy --cpu=1 --memory=128 --flavor=98 --root_gb=1 --ephemeral_gb=1`  
	`nova-manage flavor create --name=bitsy --cpu=1 --memory=256 --flavor=99 --root_gb=1 --ephemeral_gb=1`

4. To experiment with the various APIs via python:
   * `vagrant ssh`
   * `sudo pip install bpython` - optional but a nice interactive interpreter. [IPython](http://ipython.org) does a great job too.
   * Try some code!  
     `>>> from cinderclient.v1 import client`  
     `>>> USER="admin"`  
     `>>> PASS="admin"`  
     `>>> TENANT="admin"`  
     `>>> AUTH_URL="http://localhost:5000/v2.0/"`  
     `>>> c_client = client.Client(USER, PASS, TENANT, AUTH_URL, service_type="volume")`
     `>>> c_client.volumes.create(size=1, display_name="my volume :)")`  
     `<Volume: 1e6213e3-89fb-45f2-b904-b7f5ce5cdd65>`
