class irqbalance {
  include irqbalance::install, irqbalance::service
}

class irqbalance::install {
  package { 'irqbalance':
    ensure => present,
  }
}

class irqbalance::service {
  service { 'irqbalance':
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class["irqbalance::install"],
  }
}
