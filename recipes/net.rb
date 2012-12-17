riemann_server = node['riemann']['server']

runit_service 'riemann-net' do
  options :host => riemann_server
end

service 'riemann-net' do
  supports :restart => true
  action [:start]
end

gem_package 'riemann-tools' do
  action :install
  notifies :restart, resources(:service => 'riemann-net')
end
