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

remote_file "/usr/local/src/tokyocabinet-#{node[:tokyotyrantserver][:tc][:version]}.tar.gz" do
  source "http://fallabs.com/tokyocabinet/tokyocabinet-#{node[:tokyotyrantserver][:tc][:version]}.tar.gz"
end

execute "extract tokyocabinet" do
  cwd "/usr/local/src"
  command <<-EOH
     tar xvfz tokyocabinet-#{node[:tokyotyrantserver][:tc][:version]}.tar.gz
  EOH

  not_if { File.exist?("/usr/local/src/tokyocabinet-#{node[:tokyotyrantserver][:tc][:version]}/") }
end

execute "configure && make tokyocabinet" do
  cwd "/usr/local/src/tokyocabinet-#{node[:tokyotyrantserver][:tc][:version]}/"

  command <<-EOH
    ./configure
    make
    make install
  EOH

  not_if { File.exist?("/usr/local/bin/tchmgr") }

  action :run
end

remote_file "/usr/local/src/tokyotyrant-#{node[:tokyotyrantserver][:tt][:version]}.tar.gz" do
  source "http://fallabs.com/tokyotyrant/tokyotyrant-#{node[:tokyotyrantserver][:tt][:version]}.tar.gz"
end

execute "extract tokyotyrant" do
  cwd "/usr/local/src"
  command <<-EOH
     tar xvfz tokyotyrant-#{node[:tokyotyrantserver][:tt][:version]}.tar.gz
  EOH

  not_if { File.exist?("/usr/local/src/tokyotyrant-#{node[:tokyotyrantserver][:tt][:version]}") }
end

execute "configure && make tokyotyrant" do
  cwd "/usr/local/src/tokyotyrant-#{node[:tokyotyrantserver][:tt][:version]}/"

  command <<-EOH
    ./configure
    make
    make install
    rm /usr/local/sbin/ttservctl
  EOH

  not_if { File.exist?("/usr/local/bin/ttserver") }

  action :run
end
