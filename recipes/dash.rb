group 'riemann-dash'

user 'riemann-dash' do
  home node['riemann']['dash']['directory']
  group 'riemann-dash'
  shell '/bin/bash'
  system true
end

gem_package 'riemann-dash' do
  action :install
end

directory node['riemann']['dash']['directory'] do
  owner "root"
  group "root"
  mode 00755
  recursive true
  action :create
end

runit_service 'riemann-dash' do
  default_logger true
end

service 'riemann-dash' do
  supports :restart => true
  action [ :start ]
end
