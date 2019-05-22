# == Class: cgrates::install
#
#  This will install the cgrates package
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
class cgrates::install (
	$cgrates_version		= $cgrates::params::cgrates_version,
	$config_path			= $cgrates::params::config_path,
	$manage_config			= $cgrates::params::manage_config,
	$install_source			= $cgrates::params::install_source,
) inherits cgrates::params {
	
	
	# IF install source contains a URL then use that to download and install the package, else we will assume that an OS install repo is defined and contains the package
	if $install_source != '' {
		
		case $::operatingsystem {
	      /(?i:Debian|Ubuntu|Mint)/: {
	        $package_filename = "puppet-cgrates.deb"
	        $package_provider = 'dpkg'
	      }
	      # FUTURE MAYBE?
		  #/(?i:RedHat|Centos|Scientific|Suse|OracleLinux|Amazon)/: {
	      #  $package_filename = 'puppet-cgrates.rpm'
	      #  $package_provider = 'rpm'
	      #}
	      default: {
	        fail("The ${::operatingsystem} operating system isn't supported with remote install source")
	      }
	    }
		
		file { "/var/lib/cgrates":
	  		ensure => directory,
	  	  	mode   => '0755',
			before => Exec['cgrates_get_package'],
		}
		
	    exec { 'cgrates_get_package':
	      command => "/usr/bin/wget \'${install_source}' -O /var/lib/cgrates/${package_filename}",
	      creates => "/var/lib/cgrates/${package_filename}",
	      before  => Package['cgrates'],
	    }
		
	    package { 'cgrates':
	      ensure   => $cgrates_version,
	      source   => "/var/lib/cgrates/${package_filename}",
	      provider => $package_provider,
	    }
			
	} else {
		#phase 1 assumes a repo exists - one might be able to make it work without a repo - e.g. download http file and install it
    	package { 'cgrates' :
    		ensure => $cgrates_version,
    	}
	}
	
	if ( $manage_config ) {
		# ensure config directory is present and we want to purge content not defined in puppet
		file { "${config_path}":
	  		ensure => directory,
	  	  	owner  => 'root',
	  	  	group  => 'root',
	  	  	mode   => '0755',
			recurse => true, 
	  	  	purge => $manage_config,
		}
	}

}