class cgrates::subsystem::thresholds (
	$thresholds_enabled						= $cgrates::params::thresholds_enabled,
	$thresholds_indexed_selects				= $cgrates::params::thresholds_indexed_selects,
	$thresholds_store_interval				= $cgrates::params::thresholds_store_interval,
	$thresholds_string_indexed_fields		= $cgrates::params::thresholds_string_indexed_fields,
	$thresholds_prefix_indexed_fields		= $cgrates::params::thresholds_prefix_indexed_fields,
) inherits cgrates::params {


#thresholds is a bit funny so we should not include indexed fields if they are default so we don't use the generator and use a custom template
	
	file { "${cgrates::params::config_path}/thresholds.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_thresholds.erb'),
		notify		=> Service["cgrates"],
	}
	
}