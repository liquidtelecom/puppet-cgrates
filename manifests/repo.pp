# == Class: cgrates::repo
#
#  This will install the cgrates public repo
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
class cgrates::repo (
	$cgrates_release		= $cgrates::params::cgrates_release,
) inherits cgrates::params {

	case $operatingsystem {
    	'ubuntu', 'debian': { 	
			apt::source { 'cgrates': 
				location => 'http://apt.cgrates.org/debian/',
				repos => 'main',
				release => $cgrates_release,
				key => {
					id => '8BC417EB7B9C7EECE3A3BFD48058109B4994C9B7',
					source => 'http://apt.cgrates.org/apt.cgrates.org.gpg.key',
				},
			} 
		}
		default: { fail('Unrecognized operating system for CGRateS Repo Setup') }
	}

}	