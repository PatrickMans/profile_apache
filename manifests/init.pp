# == Class: profile_apache
#
# Full description of class profile_apache here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class profile_apache
(
  $packages = $::profile_apache::params::packages,
  $vhost = $::profile_apache::params::vhost,
  $docroot = $::profile_apache::params::docroot,
  $ssl_docroot = $::profile_apache::params::ssl_docroot,
  $monitor_address = $::profile_apache::params::monitor_address,
  $nfs_address = $::profile_apache::params::nfs_address,
  $nfs_mountpoint =  $::profile_apache::params::nfs_mountpoint,
  $db_address = $::profile_apache::params::db_address,
) inherits ::profile_apache::params {

  # validate parameters here

  notify {"addr from init: monitor ${monitor_address}, nfs ${nfs_address}, db ${db_address}":
    withpath => true,
  }

  class { '::profile_apache::install': } ->
  class { '::profile_apache::config': } ~>
  class { '::profile_apache::service': } ->
  Class['::profile_apache']
}