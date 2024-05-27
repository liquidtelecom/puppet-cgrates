class cgrates::subsystem::rals (
	$rals_enabled						= $cgrates::params::rals_enabled,
	$rals_thresholds_conns				= $cgrates::params::rals_thresholds_conns,
	$rals_stats_conns					= $cgrates::params::rals_stats_conns,
	$rals_rp_subject_prefix_matching	= $cgrates::params::rals_rp_subject_prefix_matching,
	$rals_remove_expired				= $cgrates::params::rals_remove_expired,
	$rals_max_computed_usage			= $cgrates::params::rals_max_computed_usage,
	$rals_balance_rating_subject		= $cgrates::params::rals_balance_rating_subject,
) inherits cgrates::params {


#rals is a bit funny so we should not include indexed fields if they are default so we don't use the generator and use a custom template
	
	file { "${cgrates::params::config_path}/rals.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_rals.erb'),
		notify		=> Service['cgrates'],
	}
	
}