# == Class: cgrates::params
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
class cgrates::params {

  	case $facts['os']['name'] {
    	'Ubuntu', 'Debian' : {
	  		#SOME PARAM
			$manage_repo		= false
			$cgrates_version	= 'installed'
			$config_path		= '/etc/cgrates'

		}
		default: { fail('Unsupported Operating System') }
  	}
  
	$manage_service 	= true
	$enable_service 	= true
	$manage_config		= true
	
}