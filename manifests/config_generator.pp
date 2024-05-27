# == DEFINE: cgrates::config_generator
#
#  This will define and deploy a single config file from an inbound HASH
#
# === Requirements
#
#  The following is needed :
#   - puppetlabs-apt
#
# === Parameters
#
# WIP
#
# === Authors
#
# Author Name: Anthony Somerset
#
# === Copyright
#
# Copyright 2019 Liquid Telecom
#

# File needs a name e.g. general.json
# file will contain a single section e.g. "general"
# a section will ultimately be contained as a JSON object
# potentially have some kind of precedence prefixed to file name 
# e.g. a_general.json, b_datadb.json etc

define cgrates::config_generator (
	$config_section	= "$name",
	$precedence 	= undef,
	$config_hash	= undef,
	$config_path	= undef,
	$ensure			= 'present',
) {

	if ( $precedence ) {
		$filename = "${precedence}_${name}"
	} else {
		$filename = $name
	}
	
	

	file { "${config_path}/${filename}.json":
  		ensure 		=> $ensure,
  	  	owner  		=> 'root',
  	  	group  		=> 'root',
  	  	mode   		=> '0644',
	    content 	=> template('cgrates/config_file.erb'),
		notify		=> Service["cgrates"],
	}

}
