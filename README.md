# riemann-chef cookbook

This code appears to have been written by Kyle Kingsbury - I swiped it from a file downloaded from his site. I've put it here to make it easy for (me) to find and hack on if necessary. I'm not supporting it, I'm not even sure if I'm going to be using Riemann in anger.

# Requirements

# Usage

This cookbook is designed to be used without being modified. You customize it by overriding attributes that the cookbook uses. Of course, pretty much the only stuff in it that can be customized is the stuff that I've needed to customize so far for my own project.

## Configuring riemann-dash

By default, this cookbook will install a default config file for riemann-dash. In order to use your own, in your own recipe set an attribute specifying where your config file is:

mycookbook/attributes/default.rb:

  normal['riemann']['dash']['config_file'] = '/opt/riemann-dash/columbus_dash_config.rb'

Then use a template or file resource to put your config file in place. 


# Attributes


['riemann']['version']                The version of riemann to grab from the package_url
['riemann']['package_url']            The base URL to find the package from. Defaults to 'http://aphyr.com/riemann/'
['riemann']['server']                 The hostname where riemann is running, which clients will use to send stuff to
['riemann']['listen']['tcp']['host']  What to bind to. Defaults to 0.0.0.0, i.e. all interfaces.
['riemann']['listen']['tcp']['port']  What port to listen on for client stuff. Default 5555
['riemann']['listen']['udp']['host']  What to bind to. Defaults to 0.0.0.0, i.e. all interfaces.
['riemann']['listen']['udp']['port']  What port to listen on for client stuff. Default 5555
['riemann']['expire_period']          Defaults to 10
['riemann']['event_ttl']              Defaults to 300
['riemann']['email_from']             Defaults to 'riemann'
['riemann']['graphite']['host']       Graphite server hostname to send metrics to. Defaults to localhost
['riemann']['dash']['config_file']    If you are making your own config file for riemann-dash, set this to the location.


# Recipes

# Author

