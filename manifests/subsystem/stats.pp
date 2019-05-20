class cgrates::subsystem::stats (
	$stats_enabled						= $cgrates::params::stats_enabled,
	$stats_indexed_selects				= $cgrates::params::stats_indexed_selects,
	$stats_store_interval				= $cgrates::params::stats_store_interval,
	$stats_store_uncompressed_limit		= $cgrates::params::stats_store_uncompressed_limit,
	$stats_string_indexed_fields		= $cgrates::params::stats_string_indexed_fields,
	$stats_prefix_indexed_fields		= $cgrates::params::stats_prefix_indexed_fields,
	$stats_thresholds_conns				= $cgrates::params::stats_thresholds_conns,
) inherits cgrates::params {


#stats is a bit funny so we should not include indexed fields if they are default so we don't use the generator and use a custom template
	
	file { "${cgrates::params::config_path}/stats.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_stats.erb'),
		notify		=> Service["cgrates"],
	}
	
}