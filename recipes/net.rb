riemann_server = search(:node, "recipe:riemann\\:\\:server AND chef_environment:#{node.chef_environment}").first

runit_service "riemann-net" do
  options :host => riemann_server
end

service 'riemann-net' do
  supports :restart => true
  action [:start]
end

gem_package "riemann-tools" do
  version '0.0.8'
  action :install
  notifies :restart, resources(:service => 'riemann-net')
end
