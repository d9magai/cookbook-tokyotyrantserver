# -*- coding: utf-8 -*-
include_recipe "build-essential::default"

%w{
zlib-devel
bzip2-devel
}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{
tokyocabinet
tokyotyrant
}.each do |key|
  package = node[:tokyotyrantserver][key]

  remote_file "#{Chef::Config[:file_cache_path]}/#{key}-#{package[:version]}.tar.gz" do
    source "http://fallabs.com/#{key}/#{key}-#{package[:version]}.tar.gz"
  end

  execute "extract #{key}" do
    cwd Chef::Config[:file_cache_path]
    command "tar xf #{key}-#{package[:version]}.tar.gz"
    not_if {File.exist?("#{Chef::Config[:file_cache_path]}/#{key}-#{package[:version]}/")}
  end

  execute "configure && make #{key}" do
    cwd "#{Chef::Config[:file_cache_path]}/#{key}-#{package[:version]}/"
    command <<-EOH
    ./configure
    make
    make install
    EOH
    not_if {File.exist?(package[:binarypath])}
    action :run
  end
end

file "/usr/local/sbin/ttservctl" do
  action :delete
end
