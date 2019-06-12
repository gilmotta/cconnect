# Manifest to place all the files to "prep" for the installs
class cconnect::fileprep {

  # Choose how to place files based on OS
  if $::osfamily == 'RedHat' or 'Debian' {

    # Make sure staging area exists
    file { '/var/tmp/nhdata':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }

    # Place config.rb
    file { '/var/tmp/nhdata/config.rb':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'https://s3.amazonaws.com/nh-storage/config.rb',
      require => File['/var/tmp/nhdata'],
    }

    # Place colorize Gem
    file { '/var/tmp/nhdata/colorize-0.8.1.gem':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'https://s3.amazonaws.com/nh-storage/colorize-0.8.1.gem',
      require => File['/var/tmp/nhdata'],
    }

    # Place json Gem
    file { '/var/tmp/nhdata/json-2.2.0.gem':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'https://s3.amazonaws.com/nh-storage/json-2.2.0.gem',
      require => File['/var/tmp/nhdata'],
    }
  }

  elsif $::osfamily == 'Windows' {

    # Make sure staging area exists
    file { 'C:/nhdata':
      ensure => 'directory',
      owner  => 'Administrators',
      group  => 'Users',
      mode   => '0755',
    }

    # Place confiug.rb
    file { 'C:/nhdata/config.rb':
      ensure  => 'present',
      owner   => 'Administrators',
      group   => 'Users',
      mode    => '0644',
      source  => 'https://s3.amazonaws.com/nh-storage/config.rb',
    }

    # Place Colorize Gem
    file { 'C:/nhdata/colorize-0.8.1.gem':
      ensure  => 'present',
      owner   => 'Administrators',
      group   => 'Users',
      mode    => '0644',
      source  => 'https://s3.amazonaws.com/nh-storage/colorize-0.8.1.gem',
    }

    # Place json Gem
    file { 'C:/nhdata/json-2.2.0.gem':
      ensure  => 'present',
      owner   => 'Administrators',
      group   => 'Users',
      mode    => '0644',
      source  => 'https://s3.amazonaws.com/nh-storage/json-2.2.0.gem',
    }
  }
}
