name             'riemann'
maintainer       'Tom Howe'
maintainer_email 'turtlebender@gmail.com'
description      'Installs/Configures Riemann'
version          '0.0.1'
#version          Time.at(`git --git-dir=#{File.join(File.dirname(__FILE__),'.git')} log --max-count=1 --pretty=format:%ct`.to_i).strftime("1.0.%Y%m%d%H%M")

depends          'java', '1.10.0'
depends          'runit', '1.1.0'
