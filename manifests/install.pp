# == Class: cgrates::install
#
#  This will install the cgrates package
#
# === Requirements
#
#  The following is needed :
#   - puppetlabs-apt
#
# === Parameters
#
# WIP
#
# === Authors
#
# Author Name: Anthony Somerset
#
# === Copyright
#
# Copyright 2019 Liquid Telecom
#
class cgrates::install (
	$cgrates_version		= $cgrates::params::cgrates_version,
) inherits zabbix::params {
	
	#phase 1 assumes a repo exists - one might be able to make it work without a repo - e.g. download http file and install it
    package { 'cgrates' :
    	ensure => $cgrates_version,
    }

}