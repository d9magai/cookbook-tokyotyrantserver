
include_recipe "tokyotyrantserver::#{node[:tokyotyrantserver][:install_method]}"

# put init script
template "/etc/init.d/ttservd" do
  source "ttservctl.erb"
  mode "0755"
end

# create log directory
directory File.dirname(node[:tokyotyrantserver][:logfile]) do
  action :create
  recursive true
end

# register as service
service "ttservd" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
