# == Class: incron
#
# Installs the incron package. Class it not required for use of the incron defined type
#
# === Authors
#
# William Leese <william.leese@meltwater.com>
#
class incron {

  package {'incron': ensure => installed }

}
