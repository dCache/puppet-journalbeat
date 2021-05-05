class site_journalbeat::service {

  service {'journalbeat':
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
    }

}