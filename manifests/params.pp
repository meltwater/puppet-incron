# == Class: incron::params
#
# Defines defaults for the incron class. Params class should not be called
# directly.
#
# === Authors
#
# Derek Tamsen <dtamsen@gmail.com>
#
class incron::params {

  case $::osfamily {
    'Debian': {
      $service_name = 'incron'
    }

    default: {
      $service_name = 'incrond'
    }
  }

}
