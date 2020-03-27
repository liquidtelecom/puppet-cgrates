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
	$config_path			= $cgrates::params::config_path,
	$manage_config			= $cgrates::params::manage_config,
) inherits cgrates::params {
	
   	package { 'cgrates' :
    	ensure => $cgrates_version,
   	}
	
	if ( $manage_config ) {
		# ensure config directory is present and we want to purge content not defined in puppet
		file { "${config_path}":
	  		ensure => directory,
	  	  	owner  => 'root',
	  	  	group  => 'root',
	  	  	mode   => '0755',
			recurse => true, 
	  	  	purge => $manage_config,
		}
	}

}