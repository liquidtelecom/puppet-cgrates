class cgrates::subsystem::dispatchers (
	$precedence 						= '1',
	$dispatchers_enabled				= $cgrates::params::dispatchers_enabled,
	$dispatchers_indexed_selects		= $cgrates::params::dispatchers_indexed_selects,
	$dispatchers_string_indexed_fields	= $cgrates::params::dispatchers_string_indexed_fields,
	$dispatchers_prefix_indexed_fields	= $cgrates::params::dispatchers_prefix_indexed_fields,
	$dispatchers_attributes_conns		= $cgrates::params::dispatchers_attributes_conns,
) inherits cgrates::params {


#dispatchers is a bit funny so we should not include indexed fields if they are default so we don't use the generator and use a custom template
	
	file { "${cgrates::params::config_path}/dispatchers.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_dispatchers.erb'),
		notify		=> Service["cgrates"],
	}
	
}