node /^devstack/ {

	#ensure git is installed
	package { 'git':
		ensure 		=> 'present',
	}

	# clone the devstack repo
	vcsrepo { "/home/vagrant/devstack":
		ensure 		=> present,
		provider 	=> git,
		source 		=> "https://github.com/openstack-dev/devstack.git",
		user 		=> 'vagrant',
		require 	=> Package["git"],
	}

	$localrc_cnt = "
ADMIN_PASSWORD=admin
MYSQL_PASSWORD=admin
RABBIT_PASSWORD=admin
SERVICE_PASSWORD=admin
SERVICE_TOKEN=admin
API_RATE_LIMIT=False"

    file { "/home/vagrant/devstack/localrc":
      content 	=> "$localrc_cnt",
      require 	=> Vcsrepo["/home/vagrant/devstack"],
      group		=> "vagrant",
      owner		=> "vagrant",
    }

	#run stack.sh as current user (vagrant)
	exec { "/home/vagrant/devstack/stack.sh":
		cwd     	=> "/home/vagrant/devstack",
		group		=> "vagrant",
		user		=> "vagrant",
		logoutput	=> on_failure,
		timeout		=> 0, # stack.sh takes time!
		require 	=> File["/home/vagrant/devstack/localrc"],
	}
}