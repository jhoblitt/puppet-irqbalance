# == Class: irqbalance::service
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
class irqbalance::service (
  $ensure = running,
) {
  validate_re($ensure, '^running$|^stopped$')

  $enable = $ensure ? {
    'running' => true,
    'stopped' => false,
  }

  service { $irqbalance::params::irqbalance_service:
    ensure     => $ensure,
    hasstatus  => $irqbalance::params::hasstatus,
    hasrestart => true,
    enable     => $enable,
  }
}
