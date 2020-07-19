# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache2::apache2_configuration
class apache2::httpd_configuration {
  exec{'updates':
    path    => '/usr/bin',
    command => 'yum update -y'
  }

  exec{'install apache2':
    path    => '/usr/bin',
    command => 'yum install -y httpd'
  }

  exec{'copy httpd config':
    path    => '/usr/bin',
    command => 'cp /etc/puppetlabs/code/environment/production/modules/apache2/files/httpd.conf /etc/httpd/conf'
  } ->

  exec{'start service':
    path    => '/usr/bin',
    command => 'systemctl start httpd'
  }

  exec{'enable service':
    path    => '/usr/bin',
    command => 'systemctl enable httpd'
  }
}
