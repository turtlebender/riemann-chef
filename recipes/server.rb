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
  variables(
    :tcp_listen_host => node['riemann']['listen']['tcp']['host'],
    :tcp_listen_port => node['riemann']['listen']['tcp']['port'],
    :udp_listen_host => node['riemann']['listen']['udp']['host'],
    :udp_listen_port => node['riemann']['listen']['udp']['port'],
    :expire_period => node['riemann']['expire_period'],
    :event_ttl => node['riemann']['event_ttl'],
    :email_from => node['riemann']['email_from'],
    :graphite_host => node['riemann']['graphite']['host']
  )
  notifies :restart, resources(:service => 'riemann')
end

directory '/var/log/riemann/' do
  mode 0755
  owner 'riemann'
  group 'riemann'
  action :create
end
