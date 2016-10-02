# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.2"

  config.vm.define 'itamae' do |itamae|
    itamae.vm.network 'private_network', ip: '192.168.33.100'
    itamae.cache.scope = :box if Vagrant.has_plugin? 'vagrant-cachier'
  end

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '1024'
  end
end
