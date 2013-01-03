# riemann-chef cookbook

This is based on code written by Kyle Kingsbury - I swiped it from a file downloaded from his site. I've put it here to make it easy for (me) to find and hack on if necessary. I'm not supporting it at this point, I'm only doing the work needed to make this work for my current project. If you find any of this useful, help yourself.

# Usage

This cookbook is designed to be used without being modified itself, so that you can manage it with Berkshelf or similar. Think of it as a library, rather than code to be customized for your local use. I have a separate, site-specific cookbook which includes the recipes from this one, and puts customized configuration into place. Examples below.

## Configuration file

Your own recipe needs to create the /etc/riemann/riemann.config file, something like this:

    include_recipe 'riemann::server'

    directory '/etc/riemann' do
      owner 'root'
      group 'root'
      action :create
    end

    template '/etc/riemann/riemann.config' do
      source 'riemann.config.erb'
      owner 'root'
      group 'root'
      mode 0644
      notifies :restart, resources(:service => 'riemann')
    end

Then put your config file in 'your-cookbooks/templates/default/riemann.config.erb'.

If you're not doing anything templatey, then just use the cookbook_file resource and put it in files/default/riemann.config.


## Configuring riemann-dash

The riemann::dash recipe installs the riemann-dash service, and will create the directory node['riemann']['dash']['directory'] for your configuration files. This defaults to /opt/riemann-dash, if you override the attribute the recipe will create whichever path you set it to.

You need to put the configuration files in that directory in your own recipe, something like this:

    include_recipe 'riemann::dash'

    remote_directory node['riemann']['dash']['directory'] do
      source 'riemann-dash'
      owner 'riemann-dash'
      group 'riemann-dash'
      files_owner 'riemann-dash'
      files_group 'riemann-dash'
      notifies :restart, resources(:service => 'riemann-dash')
    end

The configuration files would go in files/default/riemann-dash in your cookbook.


# Attributes

['riemann']['version']                The version of riemann to grab from the package_url
['riemann']['package_url']            The base URL to find the package from. Defaults to 'http://aphyr.com/riemann/'
['riemann']['server']                 The hostname where riemann is running, which clients will use to send stuff to
['riemann']['dash']['directory']      The directory where riemann-dash configuration is found
