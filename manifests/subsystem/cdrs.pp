class cgrates::subsystem::cdrs (
	$cdrs_enabled					= $cgrates::params::cdrs_enabled,
	$cdrs_extra_fields				= $cgrates::params::cdrs_extra_fields,
	$cdrs_store_cdrs				= $cgrates::params::cdrs_store_cdrs,
	$cdrs_session_cost_retries		= $cgrates::params::cdrs_session_cost_retries
	$cdrs_chargers_conns			= $cgrates::params::cdrs_chargers_conns,
	$cdrs_rals_conns				= $cgrates::params::cdrs_rals_conns,
	$cdrs_attributes_conns			= $cgrates::params::cdrs_attributes_conns,
	$cdrs_thresholds_conns			= $cgrates::params::cdrs_thresholds_conns,
	$cdrs_stats_conns				= $cgrates::params::cdrs_stats_conns,
	$cdrs_online_cdr_exports		= $cgrates::params::cdrs_online_cdr_exports,
	
) inherits cgrates::params {


#cdrs is a bit funny so we should not include indexed fields if they are default so we don't use the generator and use a custom template
	
	file { "${cgrates::params::config_path}/cdrs.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_cdrs.erb'),
		notify		=> Service["cgrates"],
	}
	
}