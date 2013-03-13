riemann_server = node['riemann']['server']

gem_package 'riemann-tools' do
  action :install
end

runit_service 'riemann-net' do
  options :host => riemann_server
end
