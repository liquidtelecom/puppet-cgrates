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
			$manage_repo		= true
			$cgrates_version	= 'installed'
			$config_path		= '/etc/cgrates'

		}
		default: { fail('Unsupported Operating System') }
  	}
	
	$cgrates_release					= 'v0.10'
  
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
	$dispatchers_enabled				= true
	$dispatchers_indexed_selects		= true
	$dispatchers_string_indexed_fields	= undef
	$dispatchers_prefix_indexed_fields	= undef
	$dispatchers_attributes_conns		= undef
	
	#stats
	$stats_enabled						= true
	$stats_indexed_selects				= true
	$stats_store_interval				= "0"
	$stats_store_uncompressed_limit		= 0
	$stats_string_indexed_fields		= undef
	$stats_prefix_indexed_fields		= undef
	$stats_thresholds_conns				= undef
	
	#thresholds
	$thresholds_enabled					= true
	$thresholds_indexed_selects			= true
	$thresholds_store_interval			= "0"
	$thresholds_string_indexed_fields	= undef
	$thresholds_prefix_indexed_fields	= undef
	
	#chargers
	$chargers_enabled					= true
	$chargers_indexed_selects			= true
	$chargers_attributes_conns			= undef
	$chargers_string_indexed_fields		= undef
	$chargers_prefix_indexed_fields		= undef
	
	#attributes
	$attributes_enabled					= true
	$attributes_indexed_selects			= true
	$attributes_string_indexed_fields	= undef
	$attributes_prefix_indexed_fields	= undef
	$attributes_process_runs			= 1
	
	#scheduler
	$scheduler_enabled					= true
	$scheduler_cdrs_conns				= undef
	
	#cdrs
	$cdrs_enabled						= true
	$cdrs_extra_fields					= undef
	$cdrs_store_cdrs					= true
	$cdrs_session_cost_retries			= 5
	$cdrs_chargers_conns				= undef
	$cdrs_rals_conns					= undef
	$cdrs_attributes_conns				= undef
	$cdrs_thresholds_conns				= undef
	$cdrs_stats_conns					= undef
	$cdrs_online_cdr_exports			= undef
	
	#sessions
	$sessions_enabled					= true
	$sessions_listen_bijson				= "127.0.0.1:2014"
	$sessions_chargers_conns			= undef
	$sessions_rals_conns				= undef
	$sessions_cdrs_conns				= undef
	$sessions_resources_conns			= undef
	$sessions_thresholds_conns			= undef
	$sessions_stats_conns				= undef
	$sessions_suppliers_conns			= undef
	$sessions_attributes_conns			= undef
	$sessions_session_replication_conns	= undef
	$sessions_debit_interval			= '0s'
	$sessions_store_session_costs		= false
	$sessions_min_call_duration			= "0s"
	$sessions_max_call_duration			= "3h"
	$sessions_session_ttl				= "0s"
	$sessions_session_ttl_max_delay		= undef
	$sessions_session_ttl_last_used		= undef
	$sessions_session_ttl_usage			= undef
	$sessions_session_indexes			= undef
	$sessions_client_protocol			= 1.0
	$sessions_channel_sync_interval		= "0"
	
	#rals
	$rals_enabled						= true
	$rals_thresholds_conns				= undef
	$rals_stats_conns					= undef
	$rals_rp_subject_prefix_matching	= false
	$rals_remove_expired				= true
	$rals_max_computed_usage			= undef
	$rals_balance_rating_subject		= undef

}