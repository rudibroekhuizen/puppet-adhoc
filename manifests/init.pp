# == Class: adhoc
#
# Full description of class adhoc here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'adhoc':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class adhoc (
  $snippets = '

file { "/tmp/example":
  content => "Written from puppet\n",
  mode    => 640
}

'
) {

  file {'/tmp/adhoc.pp':
    ensure  => present,
    mode    => 0640,
    content => $snippets,
  }

  exec { "puppet apply":
    user    => "root",
    command => "/usr/bin/puppet apply /tmp/adhoc.pp",
    require => File["/tmp/adhoc.pp"],
  }

}
