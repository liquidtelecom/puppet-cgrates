class cgrates::stor_db (
	$stor_db_type				= $cgrates::params::data_db_type,
	$stor_db_host				= $cgrates::params::data_db_host,
	$stor_db_port				= $cgrates::params::data_db_port,
	$stor_db_name				= $cgrates::params::data_db_name,
	$stor_db_user				= $cgrates::params::data_db_user,
	$stor_db_password			= $cgrates::params::data_db_password,
	$stor_db_max_open_conns		= $cgrates::params::stor_db_max_open_conns,
	$stor_db_max_idle_conns		= $cgrates::params::stor_db_max_idle_conns,
	$stor_db_conn_max_lifetime	= $cgrates::params::stor_db_conn_max_lifetime,
	$stor_db_cdrs_indexes		= $cgrates::params::stor_db_cdrs_indexes,
	$stor_db_query_timeout		= $cgrates::params::stor_db_query_timeout,
	$manage_stor_db				= $cgrates::params::manage_stor_db,
) inherits cgrates::params {

	cgrates::config_generator { 'stor_db':
		precedence 	=> '1',
		config_path => $cgrates::params::config_path,
		config_hash => {
			"db_type" 			=> $stor_db_type,
			"db_host" 			=> $stor_db_host,
			"db_port" 			=> $stor_db_port,
			"db_name" 			=> $stor_db_name,
			"db_user" 			=> $stor_db_user,
			"db_password" 		=> $stor_db_password,
			"max_open_conns" 	=> $stor_db_max_open_conns,
			"max_idle_conns" 	=> $stor_db_max_idle_conns,
			"conn_max_lifetime" => $stor_db_conn_max_lifetime,
			"cdrs_indexes" 		=> $stor_db_cdrs_indexes,
			"query_timeout" 	=> $stor_db_query_timeout,
			
		},
	}
	
}