# @summary Start of the configuration
#
# Contains linux configuration and httpd manifests initializtion

class apache2 {
  contain apache2::linux_configuration
  contain apache2::httpd_configuration
}
