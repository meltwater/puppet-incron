# == Class: incron
#
# Installs the incron package. Class it not required for use of the incron defined type
#
# === Authors
#
# William Leese <william.leese@meltwater.com>
#
class incron (
  $ensure = 'running',
  $enable_service = 'true',
  $manage_service = true,
) inherits incron::params {

  package {'incron': ensure => installed }

  if manage_service {
    service { $incron::params::service_name:
      ensure  => $ensure,
      enable  => $enable_service,
      require => Package['incron'],
    }
  }

}
