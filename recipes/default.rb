%w{ruby1.9.1 ruby1.9.1-dev rubygems}.each do |pkgname|
  package pkgname do
    action :install
  end
end
