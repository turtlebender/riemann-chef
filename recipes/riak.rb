gem_package "riemann-tools" do
  version '0.0.7'
  action :install
end

riemann_server = search(:node, "recipe:riemann\\:\\:server AND chef_environment:#{node.chef_environment}").first

runit_service "riemann-riak" do
  options :host => riemann_server
end
