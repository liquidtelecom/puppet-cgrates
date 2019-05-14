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
	$manage_service			= $cgrates::params::manage_service,
	$enable_service			= $cgrates::params::enable_service,
	$config_path			= $cgrates::params::config_path,
	$manage_config			= $cgrates::params::manage_config,
	
) inherits cgrates::params {
	
	#TODO - add manage repo support (needs public cgrates repo)

	class { '::cgrates::install':
		cgrates_version	=> $cgrates_version,
		manage_config	=> $manage_config,
		config_path		=> $config_path,
	} 
	
	class { '::cgrates::service':
		manage_service	=> $manage_service,
		enable_service	=> $enable_service,
	} 
	
	# Load some basic Config for "general" section of the config, rest is done by sub manifests
	# later we may paramaterise and call from this manifest but this could get very very messy
	# will generate general and listen sections as per the defaults unless overridden
	
	cgrates::config_generator { 'general':
		precedence 	=> '1',
		config_path => $cgrates::params::config_path,
		config_hash => {
			"node_id" => $::hostname,
		},
	}
	
	#data backend (redis/mongo)
	# for now we will assume backends "exist" or defined else where and we are just configuring
	# later we can/will add some kind of manage_backend parameter to allow config/management of a backend on a specific node
	
	#storage backend (mongo/mysql)

}