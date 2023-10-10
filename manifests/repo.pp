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
					source => 'https://apt.cgrates.org/apt.cgrates.org.gpg.key',
				},
			} 

			# TEMP workaround until APT module supports storing keys in the correct place in current Debian/Ubuntu Releases
			file { '/etc/apt/trusted.gpg.d/cgrates.asc':
				path => '/etc/apt/trusted.gpg.d/cgrates.asc',
				ensure => 'file',
				source => 'https://apt.cgrates.org/apt.cgrates.org.gpg.key',
			}
		}
		default: { fail('Unrecognized operating system for CGRateS Repo Setup') }
	}

}	