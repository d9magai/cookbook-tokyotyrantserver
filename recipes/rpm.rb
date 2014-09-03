# -*- coding: utf-8 -*-

%w{
tc
tt
}.each do |key|
  package = node[:tokyotyrantserver][key]
  rpm_filename = File.basename package['url']

  # rpm download
  remote_file "#{Chef::Config['file_cache_path']}/#{rpm_filename}" do
    source "#{package['url']}"
    checksum "#{package['checksum']}"
  end

  # rpm install
  package "#{rpm_filename} install" do
    action :install
    source "#{Chef::Config['file_cache_path']}/#{rpm_filename}"
    provider Chef::Provider::Package::Rpm
  end
end
