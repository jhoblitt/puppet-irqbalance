require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-syntax/tasks/puppet-syntax'
require 'puppet-lint/tasks/puppet-lint'
require 'rspec-system/rake_task'

PuppetSyntax.exclude_paths = ["spec/fixtures/**/*"]
PuppetLint.configuration.ignore_paths = [
  'pkg/**/*.pp',
  'spec/**/*.pp',
  'tests/**/*.pp',
]
PuppetLint.configuration.send("disable_class_inherits_from_params_class")

task :default => [
  :syntax,
  :lint,
  :spec,
]
