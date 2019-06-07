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
    archive { '/var/tmp/nhdata/config.rb':
      ensure  => 'present',
      extract => false,
      source  => 'https://s3.amazonaws.com/nh-storage/config.rb',
      require => File['/var/tmp/nhdata'],
    }

    # Place colorize Gem
    archive { '/var/tmp/nhdata/colorize-0.8.1.gem':
      ensure  => 'present',
      extract => false,
      source  => 'https://s3.amazonaws.com/nh-storage/colorize-0.8.1.gem',
      require => File['/var/tmp/nhdata'],
    }

    # Place json Gem
    archive { '/var/tmp/nhdata/json-2.2.0.gem':
      ensure  => 'present',
      extract => false,
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
    archive { 'C:/nhdata/config.rb':
      ensure  => 'present',
      extract => false,
      source  => 'https://s3.amazonaws.com/nh-storage/config.rb',
      require => File['C:/nhdata'],
    }

    # Place Colorize Gem
    archive { 'C:/nhdata/colorize-0.8.1.gem':
      ensure  => 'present',
      extract => false,
      source  => 'https://s3.amazonaws.com/nh-storage/colorize-0.8.1.gem',
      require => File['C:/nhdata'],
    }

    # Place json Gem
    archive { 'C:/nhdata/json-2.2.0.gem':
      ensure  => 'present',
      extract => false,
      source  => 'https://s3.amazonaws.com/nh-storage/json-2.2.0.gem',
      require => File['C:/nhdata'],
    }
  }
}
