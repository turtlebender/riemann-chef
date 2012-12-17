riemann_server = node['riemann']['server']

runit_service 'riemann-health' do
  options :host => riemann_server
end

service 'riemann-health' do
  supports :restart => true
  action [:start]
end

gem_package 'riemann-tools' do
  action :install
  notifies :restart, resources(:service => 'riemann-health')
end
