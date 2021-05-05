# PRIVATE CLASS: Do not call directly!
class site_journalbeat::params {

  case $facts['os']['family'] {
    'RedHat': {
      $pkg_name = 'pkg_name_on_rhel'
      $service_name = 'service_name_on_rhel'
    }
    'Debian': {
      $pkg_name = 'pkg_name_on_debian'
      $service_name = 'service_name_on_debian'
    }
    default: {
      fail("${module_name} is not supported on ${facts['os']['family']}!")
    }
  }
}