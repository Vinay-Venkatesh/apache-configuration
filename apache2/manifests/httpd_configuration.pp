# @summary Configures apache on linux server
#
# Install apache
# modify the configuration of apache in /etc/httpd
# Start it as a service and enable on boot.

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
