# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache2::apache2_configuration
class apache2::apache2_configuration {
  exec{'updates':
    path    => '/usr/bin',
    command => 'apt update -y'
  }

  exec{'install apache2':
    path    => '/usr/bin',
    command => 'apt install apache2 -y'
  }

  exec{'copy apache2 config':
    path    => '/bin',
    command => 'cp /etc/puppetlabs/code/environment/production/modules/apache2/files/000-default.conf /etc/apache2/sites-available'
  } ->

  exec{'enable service':
    path    => '/bin',
    command => 'systemctl enable apache2'
  }

  exec{'start service':
    path    => '/bin',
    command => 'systemctl start apache2'
  }
}
