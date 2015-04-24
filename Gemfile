source 'https://rubygems.org'

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

group :development, :test do
  gem 'rake',                    :require => false
  gem 'puppetlabs_spec_helper',  :require => false
  gem 'puppet-lint', '>= 1.1.0', :require => false
  gem 'puppet-syntax',           :require => false
  gem 'rspec-puppet', '~> 2.0.0', :require => false
end

group :beaker do
  gem 'serverspec',              :require => false
  gem 'beaker',                  :require => false
  gem 'beaker-rspec',            :require => false
  gem 'pry',                     :require => false
end

# vim:ft=ruby
