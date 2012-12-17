set :port, 12000
config[:client][:host] = 'internal02.iad1.boundary.com'
config[:age_scale] = 3600
config[:controllers] << '/opt/riemann-dash/controllers'
config[:views] = '/opt/riemann-dash/views'
public_dir '/opt/riemann-dash/public'
