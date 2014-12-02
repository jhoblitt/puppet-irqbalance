# == Class: irqbalance::params
#
# This class should be considered private.
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2013 Joshua Hoblitt
#
class irqbalance::params {
  case $::osfamily {
    'Debian': {
      $irqbalance_package = 'irqbalance'
      $irqbalance_service = 'irqbalance'
      $hasstatus          = false
    }
    'RedHat': {
      $irqbalance_package = 'irqbalance'
      $irqbalance_service = 'irqbalance'
      $hasstatus          = true
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
