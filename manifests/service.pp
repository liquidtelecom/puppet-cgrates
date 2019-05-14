# == Class: cgrates::service
#
#  This will manage the cgrates service
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
class cgrates::service (
	$manage_service			= $cgrates::params::manage_service,
	$enable_service			= $cgrates::params::enable_service,
) inherits zabbix::params {
	
	if ($manage_service) {
		service { 'cgrates' :
    		enable_service => $enable_service,
			ensure         => running,
			hasrestart     => true,
    	}
	}
	
}