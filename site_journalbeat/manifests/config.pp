
class site_journalbeat::config {
	
  if $site_journalbeat::journalbeat_conf_hash != {} {
    $journalbeat_configuration = $site_journalbeat::journalbeat_conf_hash['journalbeat']
 
	if has_key($journalbeat_configuration, 'Tags') and $journalbeat_configuration['Tags'] != undef {
		$journalbeat_Tags = $journalbeat_configuration['Tags']
	}
	else {
		$journalbeat_Tags = []
	}
	
	if has_key($journalbeat_configuration, 'Inputs') {
		$journalbeat_Inputs = $journalbeat_configuration['Inputs']
		
		if has_key($journalbeat_Inputs,'Paths') and $journalbeat_Inputs['Paths'] != undef {
			$journalbeat_Inputs_Paths = $journalbeat_Inputs['Paths']
		}
		else {
			$journalbeat_Inputs_Paths = []
		}
		
		if has_key($journalbeat_Inputs,'Seek') and $journalbeat_Inputs['Seek'] != undef {
			$journalbeat_Inputs_Seek = $journalbeat_Inputs['Seek']
		}
		else {
			$journalbeat_Inputs_Seek = 'cursor'
		}

		if has_key($journalbeat_Inputs,'Include_matches') and $journalbeat_Inputs['Include_matches'] != undef {
			$journalbeat_Inputs_Include_matches = $journalbeat_Inputs['Include_matches']
		}
		else {
			$journalbeat_Inputs_Include_matches = []
		}

	}

	$journalbeat_output = $journalbeat_configuration['Output']
	notify{ "Output-Config $journalbeat_output" : }
	
	file { "journalbeat-file" :
      path    => "/etc/journalbeat/journalbeat.yml",
      mode    => '0655',
      content => template("site_journalbeat/dcache_journald.yml.erb"),
    }
    
  }
  
}
