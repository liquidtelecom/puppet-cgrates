class cgrates::data_db (
	$data_db_type				= $cgrates::params::data_db_type,
	$data_db_host				= $cgrates::params::data_db_host,
	$data_db_port				= $cgrates::params::data_db_port,
	$data_db_name				= $cgrates::params::data_db_name,
	$data_db_user				= $cgrates::params::data_db_user,
	$data_db_password			= $cgrates::params::data_db_password,
	$data_db_redis_sentinel		= $cgrates::params::data_db_redis_sentinel,
	$data_db_query_timeout		= $cgrates::params::data_db_query_timeout,
	$manage_data_db				= $cgrates::params::manage_data_db,
) inherits cgrates::params {

	cgrates::config_generator { 'data_db':
		precedence 	=> '1',
		config_path => $cgrates::params::config_path,
		config_hash => {
			"db_type" 			=> $data_db_type,
			"db_host" 			=> $data_db_host,
			"db_port" 			=> $data_db_port,
			"db_name" 			=> $data_db_name,
			"db_user" 			=> $data_db_user,
			"db_password" 		=> $data_db_password,
			"redis_sentinel" 	=> $data_db_redis_sentinel,
			"query_timeout" 	=> $data_db_query_timeout,
			
		},
	}
	
}