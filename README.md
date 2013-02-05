# Automate Your Devstack!

This project will allow you automate the creation of a VM with [devstack](http://www.devstack.org) installed and running.

## Prereqs

* Install [VirtualBox](http://virtualbox.org)
* Install [vagrant](http://vagrantup.com)
* Optionally, but it's a good idea, install the vagrant virtualbox [guest additions plugin](https://github.com/dotless-de/vagrant-vbguest)
* You should have the vagrant project supplied `precise64` box installed. If you don't then execute this: `vagrant box add precise64 http://files.vagrantup.com/precise64.box`

## Install
* Clone this repository
* `cd icclab-vagrant-devstack`
* `git submodules init`
* `git submodules update`
* `vagrant up`

The initial install takes time so go do something useful or have a coffee! :-) When it's done, you should be able to reach the OpenStack dashboard from [http://localhost:8080](http://localhost:8080). If you see a default apache page then execute `vagrant reload`. If you wish to ssh to the OpenStack virtual box execute `vagrant ssh`.