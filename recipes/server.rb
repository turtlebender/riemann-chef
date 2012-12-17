version = '0.1.0'

user "riemann" do
  home "/home/riemann"
  shell "/bin/bash"
  system true
end

remote_file "/tmp/riemann_#{version}.deb" do
  source "http://aphyr.com/riemann/riemann_#{version}.deb"
  mode 0644
end

dpkg_package "/tmp/riemann_#{version}.deb"

runit_service "riemann"

service "riemann" do
  supports :restart => true
  action [:start]
end

template "/etc/riemann/riemann.config" do
  source "riemann.config.erb"
  owner "root"
  group "root"
  mode 0644

  notifies :restart, resources(:service => 'riemann')
end

directory "/var/log/riemann/" do
  mode 0755
  owner 'riemann'
  group 'riemann'
  action :create
end
