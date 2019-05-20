class cgrates::subsystem::sessions (
	$sessions_enabled						= $cgrates::params::sessions_enabled,
	$sessions_listen_bijson					= $cgrates::params::sessions_listen_bijson,
	$sessions_chargers_conns				= $cgrates::params::sessions_chargers_conns,
	$sessions_rals_conns					= $cgrates::params::sessions_rals_conns,
	$sessions_cdrs_conns					= $cgrates::params::sessions_cdrs_conns,
	$sessions_resources_conns				= $cgrates::params::sessions_resources_conns,
	$sessions_thresholds_conns				= $cgrates::params::sessions_thresholds_conns,
	$sessions_stats_conns					= $cgrates::params::sessions_stats_conns,
	$sessions_suppliers_conns				= $cgrates::params::sessions_suppliers_conns,
	$sessions_attributes_conns				= $cgrates::params::sessions_attributes_conns,
	$sessions_session_replication_conns		= $cgrates::params::sessions_session_replication_conns,
	$sessions_debit_interval				= $cgrates::params::sessions_debit_interval,
	$sessions_store_session_costs			= $cgrates::params::sessions_store_session_costs,
	$sessions_min_call_duration				= $cgrates::params::sessions_min_call_duration,
	$sessions_max_call_duration				= $cgrates::params::sessions_max_call_duration,
	$sessions_session_ttl					= $cgrates::params::sessions_session_ttl,
	$sessions_session_ttl_max_delay			= $cgrates::params::sessions_session_ttl_max_delay,
	$sessions_session_ttl_last_used			= $cgrates::params::sessions_session_ttl_last_used,
	$sessions_session_ttl_usage				= $cgrates::params::sessions_session_ttl_usage,
	$sessions_session_indexes				= $cgrates::params::sessions_session_indexes,
	$sessions_client_protocol				= $cgrates::params::sessions_client_protocol,
	$sessions_channel_sync_interval			= $cgrates::params::sessions_channel_sync_interval,
) inherits cgrates::params {


#sessions is a bit funny so we should not include indexed fields if they are default so we don't use the generator and use a custom template
	
	file { "${cgrates::params::config_path}/sessions.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_sessions.erb'),
		notify		=> Service["cgrates"],
	}
	
}