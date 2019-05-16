class cgrates::subsystem::dispatchers (
	$precedence 						= '1',
	$dispatchers_enabled				= $cgrates::params::dispatchers_enabled,
	$dispatchers_indexed_selects		= $cgrates::params::dispatchers_indexed_selects,
	$dispatchers_string_indexed_fields	= $cgrates::params::dispatchers_string_indexed_fields,
	$dispatchers_prefix_indexed_fields	= $cgrates::params::dispatchers_prefix_indexed_fields,
	$dispatchers_attributes_conns		= $cgrates::params::dispatchers_attributes_conns,
) inherits cgrates::params {


#dispatchers is a bit funny so we should not include indexed fields if they are default
	
	

	cgrates::config_generator { 'dispatchers':
		precedence 	=> $precedence,
		config_path => $cgrates::params::config_path,
		config_hash => {
			"enabled" 				=> $dispatchers_enabled,
			"indexed_selects" 		=> $dispatchers_indexed_selects,
			"string_indexed_fields" => ($dispatchers_string_indexed_fields if $dispatchers_string_indexed_fields),
			"prefix_indexed_fields" => ($dispatchers_prefix_indexed_fields if $dispatchers_prefix_indexed_fields),
			"attributes_conns" 		=> ($dispatchers_attributes_conns if $dispatchers_attributes_conns),			
		}.reject{ |k,v| v.nil? },
	}
	
}