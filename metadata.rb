name             'riemann'
maintainer       'Nobody, really'
maintainer_email 'none'
description      'Installs/Configures Riemann'
version          Time.at(`git --git-dir=#{File.join(File.dirname(__FILE__),'.git')} log --max-count=1 --pretty=format:%ct`.to_i).strftime("1.0.%Y%m%d%H%M")

depends          'java'
depends          'runit'
