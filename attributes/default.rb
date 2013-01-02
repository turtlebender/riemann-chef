
default['riemann']['version']     = '0.1.5'
default['riemann']['package_url'] = 'http://aphyr.com/riemann/'
default['riemann']['server']      = 'localhost'

default['riemann']['listen']['tcp']['host'] = 'localhost'
default['riemann']['listen']['tcp']['port'] = '5555'
default['riemann']['listen']['udp']['host'] = 'localhost'
default['riemann']['listen']['udp']['port'] = '5555'
default['riemann']['expire_period']         = 10
default['riemann']['event_ttl']             = 300
default['riemann']['email_from']            = 'riemann'
default['riemann']['graphite']['host']      = 'localhost'

default['riemann']['dash']['config_default'] = '/opt/riemann-dash/config.rb'
