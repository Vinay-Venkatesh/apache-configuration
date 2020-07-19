# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache2
class apache2 {
  contain apache2::linux_configuration
  contain apache2::apache2_configuration
}
