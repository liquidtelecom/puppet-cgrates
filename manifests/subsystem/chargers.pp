class cgrates::subsystem::chargers (
	$chargers_enabled					= $cgrates::params::chargers_enabled,
	$chargers_indexed_selects			= $cgrates::params::chargers_indexed_selects,
	$chargers_attributes_conns			= $cgrates::params::chargers_attributes_conns,
	$chargers_string_indexed_fields		= $cgrates::params::chargers_string_indexed_fields,
	$chargers_prefix_indexed_fields		= $cgrates::params::chargers_prefix_indexed_fields,
) inherits cgrates::params {


#chargers is a bit funny so we should not include indexed fields if they are default so we don't use the generator and use a custom template
	
	file { "${cgrates::params::config_path}/chargers.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_chargers.erb'),
		notify		=> Service["cgrates"],
	}
	
}