include_recipe 'runit::default'

gem_package 'riemann-tools' do
  action :install
end

runit_service 'riemann-health' do
  options :host => node['riemann']['server']
  default_logger true
end
