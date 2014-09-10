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

packagename = {'tc' => 'tokyocabinet', 'tt' => 'tokyotyrant'}
%w{
tc
tt
}.each do |key|
  package = node[key]
  basename = "#{packagename[key]}-#{package[:version]}"

  remote_file "#{Chef::Config[:file_cache_path]}/#{basename}.tar.gz" do
    source "http://fallabs.com/#{packagename[key]}/#{basename}.tar.gz"
  end

  execute "extract #{packagename[key]}" do
    cwd Chef::Config[:file_cache_path]
    command "tar xf #{basename}.tar.gz"
    not_if {File.exist?("#{Chef::Config[:file_cache_path]}/#{basename}/")}
  end

  execute "configure && make #{packagename[key]}" do
    cwd "#{Chef::Config[:file_cache_path]}/#{basename}/"
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
