# cgrates

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with cgrates](#setup)
    * [What cgrates affects](#what-cgrates-affects)
    * [Setup requirements](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Contributing - Guide for contributing to the module](#contributing)

## Description

This module seems to be able to manage the cgrates(http://cgrates.org/) rating engine      

This module will try to install CGRateS from an apt repo and configure key services, because of the flexibility of cgrates configuration, this module will seek to try to remain flexible, either by letting the user to generate config files directly or to use specific sub-manifests for each key microservice in the architecture.

## Setup

### What cgrates affects

Right now this module assumes that you have configured an APT repo that contains the cgrates package, later it will be able to use a http source to download the deb. Right now this module is not doing anything to configure the data_db and stor_db backends, these should be configured seperately, perhaps with modules like:

* [puppetlabs/mysql](https://forge.puppet.com/puppetlabs/mysql)
* [puppet-redis](https://forge.puppet.com/puppet/redis)

This Module is only tested on current Ubuntu 18.04 LTS, but there is no reason why current Ubuntu (Non-LTS) and Debian releases won't work but Your Mileage May Vary

### Setup Requirements 

Install the Module in your usual preferred way

## Usage

### Basic Setup of Package and Service and Defaults

```puppet
include ::cgrates
```

## Reference

Users need a complete list of your module's classes, types, defined types providers, facts, and functions, along with the parameters for each. You can provide this list either via Puppet Strings code comments or as a complete list in the README Reference section.

* If you are using Puppet Strings code comments, this Reference section should include Strings information so that your users know how to access your documentation.

* If you are not using Puppet Strings, include a list of all of your classes, defined types, and so on, along with their parameters. Each element in this listing should include:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

## Limitations

Right now, Only Current Ubuntu LTS is supported, this module does not yet configure data storage backends and assumes they exist already

## Contributing

* Fork it
* Create a feature branch (`git checkout -b my-new-feature`)
* Run rspec tests (`bundle exec rake spec`)
* Commit your changes (`git commit -am 'Added some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new Pull Request
