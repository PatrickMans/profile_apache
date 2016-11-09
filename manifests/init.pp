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
  # software
  ) inherits ::profile_apache::params {
  # validate parameters here
  notify {}

  class { '::profile_apache::install': } ->
  class { '::profile_apache::config': } ~>
  class { '::profile_apache::service': } ->
  Class['::profile_apache']
}
