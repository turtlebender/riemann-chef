version = node['riemann']['version']

if platform?('ubuntu', 'debian')
  package_url = "#{node['riemann']['package_url']}/riemann_#{version}_all.deb"
else
  raise ArgumentError, "Platform #{platform} not supported"
end

cached_file = "#{Chef::Config[:file_cache_path]}/riemann_#{version}_all.deb"

user 'riemann' do
  home '/home/riemann'
  shell '/bin/bash'
  system true
end

remote_file cached_file do
  source package_url
  mode 0644
  not_if 'dpkg -s riemann'
end

dpkg_package cached_file do
  not_if 'dpkg -s riemann'
end

runit_service 'riemann'

service 'riemann' do
  supports :restart => true
  action [:start]
end

template '/etc/riemann/riemann.config' do
  source 'riemann.config.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, resources(:service => 'riemann')
end

directory '/var/log/riemann/' do
  mode 0755
  owner 'riemann'
  group 'riemann'
  action :create
end
