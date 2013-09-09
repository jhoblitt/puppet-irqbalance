Puppet irqbalance Module
========================

[![Build Status](https://travis-ci.org/jhoblitt/puppet-irqbalance.png)](https://travis-ci.org/jhoblitt/puppet-irqbalance)

#### Table of Contents

1. [Overview](#overview)
2. [Description](#description)
3. [Usage](#usage)
4. [Limitations](#limitations)
    * [Tested Platforms](#tested-platforms)
5. [Support](#support)


Overview
--------

Manages the irqbalance package

Description
-----------

Installs and manages the the [IRQ balancing daemon](http://irqbalance.org/)
software package.  The daemon is only enabled/started if the system has a
`$::processorcount`of greater than one.  This is because the daemon will
automatically exit on single processor systems.

Usage
-----

    include irqbalance

    class { 'irqbalance': }

    class { 'irqbalance': ensure => present }
    class { 'irqbalance': ensure => latest }
    class { 'irqbalance': ensure => absent }

Limitations
-----------

On `$::osfamily == 'RedHat'`, no attempt is made to manage
`/etc/sysconfig/irqbalance`.  This is arguably a bug.

### Tested Platforms

* el5.x
* el6.x


Support
-------

Please log tickets and issues at
[github](https://github.com/jhoblitt/puppet-irqbalance/issues)

