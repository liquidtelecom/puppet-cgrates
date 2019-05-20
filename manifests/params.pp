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
  
	$manage_service 					= true
	$enable_service 					= true
	$manage_config						= true
	$node_id							= $::hostname
	$default_tenant						= 'cgrates.org'
	
	
	$rpc_json_bind						= '127.0.0.1:2012'
	$rpc_json_tls_bind					= '127.0.0.1:2022'
	$rpc_gob_bind						= '127.0.0.1:2013'
	$rpc_gob_tls_bind					= '127.0.0.1:2023'
	$rpc_http_bind						= '127.0.0.1:2080'
	$rpc_http_tls_bind					= '127.0.0.1:2280'
	
	# data_db params
	$data_db_type						= '*redis'
	$data_db_host						= '127.0.0.1'
	$data_db_port						= 6379
	$data_db_name						= "10"
	$data_db_user						= 'cgrates'
	$data_db_password					= ''
	$data_db_redis_sentinel				= ''
	$data_db_query_timeout				= '10s'
	$manage_data_db						= false
	
	# stor_db params
	$stor_db_type						= '*mysql'
	$stor_db_host						= '127.0.0.1'
	$stor_db_port						= 3306
	$stor_db_name						= 'cgrates'
	$stor_db_user						= 'cgrates'
	$stor_db_password					= ''
	$stor_db_max_open_conns				= 100
	$stor_db_max_idle_conns				= 10
	$stor_db_conn_max_lifetime			= 0
	$stor_db_cdrs_indexes				= []
	$stor_db_query_timeout				= '10s'
	$manage_stor_db						= false
	
	#dispatchers
	$dispatchers_enabled				= false
	$dispatchers_indexed_selects		= true
	$dispatchers_string_indexed_fields	= undef
	$dispatchers_prefix_indexed_fields	= undef
	$dispatchers_attributes_conns		= undef
	
	#stats
	$stats_enabled						= false
	$stats_indexed_selects				= true
	$stats_store_interval				= "0"
	$stats_store_uncompressed_limit		= 0
	$stats_string_indexed_fields		= undef
	$stats_prefix_indexed_fields		= undef
	$stats_thresholds_conns				= undef
	
}