gem_package 'riemann-tools' do
  action :install
end

riemann_server = node['riemann']['server']

runit_service 'riemann-riak' do
  options :host => riemann_server
end
