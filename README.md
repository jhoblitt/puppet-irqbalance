Puppet irqbalance Module
========================

[![Build Status](https://travis-ci.org/jhoblitt/puppet-irqbalance.png)](https://travis-ci.org/jhoblitt/puppet-irqbalance)

#### Table of Contents

1. [Overview](#overview)
2. [Description](#description)
3. [Usage](#usage)
4. [Limitations](#limitations)
    * [Tested Platforms](#tested-platforms)
5. [Versioning](#versioning)
6. [Support](#support)
7. [See Also](#see-also)


Overview
--------

Manages the irqbalance package


Description
-----------

Installs and manages the the [IRQ balancing
daemon](https://github.com/Irqbalance/irqbalance) software package.  The daemon
is only enabled/started if the system has a `$::processorcount`of greater than
one.  This is because the daemon will automatically exit on single processor
systems.


Usage
-----

```puppet
include irqbalance

class { 'irqbalance': }

class { 'irqbalance': ensure => present } # default
class { 'irqbalance': ensure => latest }
class { 'irqbalance': ensure => absent }
```

 * `ensure`

    `String` defaults to: `present`

    Uses Standard Puppet ensure semantics.
    Valid values are: `present`, `absent`


Limitations
-----------

On `$::osfamily == 'RedHat'`, no attempt is made to manage
`/etc/sysconfig/irqbalance`.  This is arguably a bug.

### Tested Platforms

* el5.x
* el6.x


Versioning
----------

This module is versioned according to the [Semantic Versioning
2.0.0](http://semver.org/spec/v2.0.0.html) specification.


Support
-------

Please log tickets and issues at
[github](https://github.com/jhoblitt/puppet-irqbalance/issues)


See Also
--------

 * [IRQ balancing daemon](https://github.com/Irqbalance/irqbalance)
