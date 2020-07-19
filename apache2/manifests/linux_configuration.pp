# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache2::linux_configuration
class apache2::linux_configuration {
  #Create mount location and add a record in /etc/fstab
  $hash      = loadjson("/etc/puppetlabs/code/environment/production/modules/apache2/files/mount.json")
  $id        = $hash['filesystem_id']
  $mounts    = $hash['mount_points']

  $id.each |$index, $value|{
    $filesystem_id = $id[$index]
    $mount_loc     = $mounts[$index]

    file{"${mount_loc}":
      ensure => 'directory',
      owner  => 'root',
      mode   => '0755',
    }->

    file_line{"update /etc/fstab-${index}":
      path   => '/etc/fstab',
      line   => "${filesystem_id} ${mount_loc} xfs  defaults,nofail  0  2"
    }
  }

  #Mount volumes
  exec{'mount_volumes':
    path        => '/bin',
    command     => 'mount -a'
  }

  #Copy custom index.html file to ebs volume
  exec{'copy index.html':
    path    => '/bin',
    command => 'cp /etc/puppetlabs/code/environment/production/modules/apache2/files/index.html /ebs'
  }

  exec{'change filesystem permission':
    path    => '/bin',
    command => 'chmod 755 -R /ebs'
  }
}
