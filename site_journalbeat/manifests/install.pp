
class site_journalbeat::install {

   ensure_resources('yumrepo',
		{ 'logstash-7.x' =>
			{ descr     => "Elastic repository for 7.x packages",
			  baseurl   => "https://artifacts.elastic.co/packages/7.x/yum",
			  gpgkey    => "https://artifacts.elastic.co/GPG-KEY-elasticsearch",
			  enabled   => 1,
			  gpgcheck  => 1,
			}
		},
		{'ensure' => 'present'})
		
  package {'journalbeat':
    ensure => present,
    require => Yumrepo['logstash-7.x']
  }
  
}