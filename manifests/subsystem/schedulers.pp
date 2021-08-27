class cgrates::subsystem::schedulers (
	$schedulers_enabled			= $cgrates::params::schedulers_enabled,
	$schedulers_cdrs_conns		= $cgrates::params::schedulers_cdrs_conns,
) inherits cgrates::params {


#scheduler is a bit funny so we should not include indexed fields if they are default so we don't use the generator and use a custom template
	
	file { "${cgrates::params::config_path}/schedulers.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_schedulers.erb'),
		notify		=> Service["cgrates"],
	}
	
}