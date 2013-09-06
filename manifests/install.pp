# == Class: irqbalance::install
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
class irqbalance::install (
  $ensure = present,
) {
  validate_re($ensure, '^present$|^absent$|^latest$')

  package { $irqbalance::params::irqbalance_package:
    ensure => $ensure,
  }
}
