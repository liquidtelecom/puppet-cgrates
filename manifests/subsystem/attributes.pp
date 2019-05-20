class cgrates::subsystem::attributes (
	$attributes_enabled					= $cgrates::params::attributes_enabled,
	$attributes_indexed_selects			= $cgrates::params::attributes_indexed_selects,
	$attributes_string_indexed_fields	= $cgrates::params::attributes_string_indexed_fields,
	$attributes_prefix_indexed_fields	= $cgrates::params::attributes_prefix_indexed_fields,
	$attributes_process_runs			= $cgrates::params::attributes_prefix_indexed_fields,
) inherits cgrates::params {


#attributes is a bit funny so we should not include indexed fields if they are default so we don't use the generator and use a custom template
	
	file { "${cgrates::params::config_path}/attributes.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_attributes.erb'),
		notify		=> Service["cgrates"],
	}
	
}