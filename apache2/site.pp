# Run Stages
stage { 'linux_configuration': }
stage { 'apache2': }

Stage['linux_configuration'] -> Stage['apache2']

#Node Definition
class { 'apache2::linux_configuration':
  stage => 'linux_configuration'
}

class { 'apache2::apache2_configuration':
  stage => 'apache2'
}


