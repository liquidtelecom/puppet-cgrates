class cgrates::subsystem::scheduler (
	$scheduler_enabled			= $cgrates::params::scheduler_enabled,
	$scheduler_cdrs_conns		= $cgrates::params::scheduler_cdrs_conns,
) inherits cgrates::params {


#scheduler is a bit funny so we should not include indexed fields if they are default so we don't use the generator and use a custom template
	
	file { "${cgrates::params::config_path}/scheduler.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_scheduler.erb'),
		notify		=> Service["cgrates"],
	}
	
}