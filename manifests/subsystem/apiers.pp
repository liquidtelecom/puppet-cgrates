class cgrates::subsystem::apiers (
	$apiers_enabled						= $cgrates::params::apiers_enabled,
	$apiers_caches_conns				= $cgrates::params::apiers_caches_conns,
	$apiers_scheduler_conns				= $cgrates::params::apiers_scheduler_conns,
	$apiers_attributes_conns			= $cgrates::params::apiers_attributes_conns,
) inherits cgrates::params {
	
	file { "${cgrates::params::config_path}/apiers.json":
  		ensure 		=> 'present',
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_apiers.erb'),
		notify		=> Service["cgrates"],
	}
	
}