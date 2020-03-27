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
	$manage_repo				= $cgrates::params::manage_repo,
	$cgrates_version			= $cgrates::params::cgrates_version,
	$cgrates_release			= $cgrates::params::cgrates_release,
	$manage_service				= $cgrates::params::manage_service,
	$enable_service				= $cgrates::params::enable_service,
	$config_path				= $cgrates::params::config_path,
	$install_source				= $cgrates::params::install_source,
	$manage_config				= $cgrates::params::manage_config,
	$node_id					= $cgrates::params::node_id,
	$default_tenant				= $cgrates::params::default_tenant,
	$rpc_json_bind				= $cgrates::params::rpc_json_bind,
	$rpc_json_tls_bind			= $cgrates::params::rpc_json_tls_bind,
	$rpc_gob_bind				= $cgrates::params::rpc_gob_bind,
	$rpc_gob_tls_bind			= $cgrates::params::rpc_gob_tls_bind,
	$rpc_http_bind				= $cgrates::params::rpc_http_bind,
	$rpc_http_tls_bind			= $cgrates::params::rpc_http_tls_bind,
	# data_db params
	$data_db_type				= $cgrates::params::data_db_type,
	$data_db_host				= $cgrates::params::data_db_host,
	$data_db_port				= $cgrates::params::data_db_port,
	$data_db_name				= $cgrates::params::data_db_name,
	$data_db_user				= $cgrates::params::data_db_user,
	$data_db_password			= $cgrates::params::data_db_password,
	$data_db_redis_sentinel		= $cgrates::params::data_db_redis_sentinel,
	$data_db_query_timeout		= $cgrates::params::data_db_query_timeout,
	$manage_data_db				= $cgrates::params::manage_data_db,
	# stor_db params
	$stor_db_type				= $cgrates::params::data_db_type,
	$stor_db_host				= $cgrates::params::data_db_host,
	$stor_db_port				= $cgrates::params::data_db_port,
	$stor_db_name				= $cgrates::params::data_db_name,
	$stor_db_user				= $cgrates::params::data_db_user,
	$stor_db_password			= $cgrates::params::data_db_password,
	$stor_db_max_open_conns		= $cgrates::params::stor_db_max_open_conns,
	$stor_db_max_idle_conns		= $cgrates::params::stor_db_max_idle_conns,
	$stor_db_conn_max_lifetime	= $cgrates::params::stor_db_conn_max_lifetime,
	$stor_db_cdrs_indexes		= $cgrates::params::stor_db_cdrs_indexes,
	$stor_db_query_timeout		= $cgrates::params::stor_db_query_timeout,
	$manage_stor_db				= $cgrates::params::manage_stor_db,
	
	
	
) inherits cgrates::params {
	
	#TODO - allow custom repo
	if $install_source == undef {
		if $manage_repo {
			class { '::cgrates::repo':
				cgrates_release	=>	$cgrates_release,
			}
		}
	}

	class { '::cgrates::install':
		cgrates_version	=> $cgrates_version,
		manage_config	=> $manage_config,
		config_path		=> $config_path,
		install_source	=> $install_source,
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
			"node_id" 			=> $node_id,
			"default_tenant"	=> $default_tenant,
		},
	}
	
	cgrates::config_generator { 'listen':
		precedence 	=> '1',
		config_path => $cgrates::params::config_path,
		config_hash => {
			"rpc_json" 		=> $rpc_json_bind,
			"rpc_gob" 		=> $rpc_gob_bind,
			"http" 			=> $rpc_http_bind,
			"rpc_json_tls" 	=> $rpc_json_tls_bind,
			"rpc_gob_tls" 	=> $rpc_gob_tls_bind,
			"http_tls" 		=> $rpc_http_tls_bind,
		},
	}
	
	#data backend (redis/mongo)
	# for now we will assume backends "exist" or defined else where and we are just configuring
	# later we can/will add some kind of manage_backend parameter to allow config/management of a backend on a specific node
	
	class { '::cgrates::data_db':
		data_db_type				=> $data_db_type,
		data_db_host				=> $data_db_host,
		data_db_port				=> $data_db_port,
		data_db_name				=> $data_db_name,
		data_db_user				=> $data_db_user,
		data_db_password			=> $data_db_password,
		data_db_redis_sentinel		=> $data_db_redis_sentinel,
		data_db_query_timeout		=> $stor_db_query_timeout,
		manage_data_db				=> $manage_data_db,
	} 
		
	#storage backend (mongo/mysql)

	class { '::cgrates::stor_db':
		stor_db_type				=> $stor_db_type,
		stor_db_host				=> $stor_db_host,
		stor_db_port				=> $stor_db_port,
		stor_db_name				=> $stor_db_name,
		stor_db_user				=> $stor_db_user,
		stor_db_password			=> $stor_db_password,
		stor_db_max_open_conns		=> $stor_db_max_open_conns,
		stor_db_max_idle_conns		=> $stor_db_max_idle_conns,
		stor_db_conn_max_lifetime	=> $stor_db_conn_max_lifetime,
		stor_db_cdrs_indexes		=> $stor_db_cdrs_indexes,
		stor_db_query_timeout		=> $stor_db_query_timeout,
		manage_stor_db				=> $manage_stor_db,
	} 

}