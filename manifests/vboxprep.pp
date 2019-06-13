# Manifest to place the Virtualbox installer based on os
class cconnect::vboxprep {

  # Place the Virtualbox files based on OS
  if $::osfamily == 'Debian' {

    # Place the extension pack
    file { '/tmp/nhdata/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'https://s3.amazonaws.com/nh-storage/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack',
      require => File['/tmp/nhdata'],
    }

    # Place the Virtualbox Installer
    file { '/tmp/nhdata/virtualbox-6.0_6.0.8-130520_Ubuntu_bionic_amd64.deb':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'https://s3.amazonaws.com/nh-storage/virtualbox-6.0_6.0.8-130520_Ubuntu_bionic_amd64.deb',
      require => File['/tmp/nhdata'],
    }
  }

  elsif $::osfamily == 'Windows' {

    # Place the extension Pack
    file { 'C:/nhdata/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack':
      ensure => 'present',
      owner  => 'Administrators',
      group  => 'Users',
      mode   => '0755',
      source => 'https://s3.amazonaws.com/nh-storage/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack',
    }

    # Place the Virtualbox Installer
    file { 'C:/nhdata/VirtualBox-6.0.8-130520-Win.exe':
      ensure => 'present',
      owner  => 'Administrators',
      group  => 'Users',
      mode   => '0755',
      source => 'https://s3.amazonaws.com/nh-storage/VirtualBox-6.0.8-130520-Win.exe',
    }
  }

  elsif $::osfamily == 'RedHat' {

    # Place the extenstion pack
    file { '/tmp/nhdata/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'https://s3.amazonaws.com/nh-storage/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack',
      require => File['/tmp/nhdata'],
    }

    # Place the Virtualbox installer
    file { '/tmp/nhdata/VirtualBox-6.0-6.0.8_130520_el7-1.x86_64.rpm':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'https://s3.amazonaws.com/nh-storage/VirtualBox-6.0-6.0.8_130520_el7-1.x86_64.rpm',
      require => File['/tmp/nhdata'],
    }
  }
}
