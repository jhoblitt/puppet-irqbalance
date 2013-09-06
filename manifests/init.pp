# == Class: irqbalance
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2013 Joshua Hoblitt
#
class irqbalance (
  $ensure = present,
) inherits irqbalance::params {
  validate_re($ensure, '^present$|^absent$|^latest$')

  case $ensure {
    'present', 'latest': {
      # the irqbalance balance daemon exits if there is only one processor
      # present in the system.  If the service state is set to running, puppet
      # will show activity on every run as it will restart the daemon (which
      # then promptly exits).
      if $::processorcount > 1 {
        $service_ensure = 'running'
      } else {
        $service_ensure = 'stopped'
      }

      Class['Irqbalance::Install'] ->
      Class['Irqbalance::Service'] ->
      Class['Irqbalance']
    }
    'absent': {
      $service_ensure = 'stopped'

      Class['Irqbalance::Service'] ->
      Class['Irqbalance::Install'] ->
      Class['Irqbalance']
    }
    default: {
      fail("${module_name}: this should not happen")
    }
  }

  class { 'irqbalance::install':
    ensure => $ensure,
  }

  class { 'irqbalance::service':
    ensure => $service_ensure,
  }
}
