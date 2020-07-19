# Run Stages
stage { 'linux_configuration': }
stage { 'httpd': }

Stage['linux_configuration'] -> Stage['httpd']

#Node Definition
class { 'apache2::linux_configuration':
  stage => 'linux_configuration'
}

class { 'apache2::httpd_configuration':
  stage => 'httpd'
}


