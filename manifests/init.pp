# Class: goaudit
# ===========================
#
# Full description of class goaudit here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'goaudit':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class goaudit (
  $package_name   = $goaudit::params::package_name,
  $package_ensure = $goaudit::params::package_ensure,
  $config_file    = $goaudit::params::config_file,
  $service_name   = $goaudit::params::service_name,
  $service_ensure = $goaudit::params::service_ensure,
) inherits goaudit::params {

  validate_string($package_name)
  validate_string($package_ensure)
  validate_absolute_path($config_file)
  validate_string($service_name)
  validate_string($service_ensure)

  anchor { 'goaudit::begin': } ->
  class { '::goaudit::install': } ->
  class { '::goaudit::config': } ~>
  class { '::goaudit::service': } ->
  anchor { 'goaudit::end': }

}
