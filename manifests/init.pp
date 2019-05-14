# == Class: cgrates
#
#  This will install and configure the cgrates package
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

class cgrates (
	$manage_repo			= $cgrates::params::manage_repo,
	$cgrates_version		= $cgrates::params::cgrates_version,
) inherits zabbix::params {
	
	#TODO - add manage repo support (needs public cgrates repo)

	class { '::cgrates::install':
		cgrates_version	=> $cgrates_version,
	} 


}