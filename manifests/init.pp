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
  $manage_service = true,
) {

  package {'incron': ensure => installed }

  if manage_service {
    if $ensure == 'running' {
      $enable = true
    } else {
      $enable = false
    }

    service {'incrond': 
      ensure  => $ensure,
      enable  => $enable,
      require => Package['incron']     
    }
  }

}
