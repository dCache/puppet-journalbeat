#
# @summary <Replace with short summary for your hostgroup>
#
# @param <parameter name>
#   <Description of the parameter>
#
class site_journalbeat ( $service_name = 'journalbeat.service',
					     $journalbeat_conf_hash = {}
) {
  
   Class['site_journalbeat::install']
   -> Class['site_journalbeat::config']
   ~> Class['site_journalbeat::service']

   contain site_journalbeat::install
   contain site_journalbeat::config
   contain site_journalbeat::service

}