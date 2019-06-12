# Manifest to place the Virtualbox installer based on os
class cconnect::vboxprep {

  # Place the Virtualbox files based on OS
  if $::osfamily == 'Debian' {

    # Place the extension pack
    archive { '/var/tmp/nhdata/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack':
      ensure  => 'present',
      extract => false,
      source  => 's3://nh-storage/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack',
      require => File['/var/tmp/nhdata'],
    }

    # Place the Virtualbox Installer
    archive { '/var/tmp/nhdata/virtualbox-6.0_6.0.8-130520_Ubuntu_bionic_amd64.deb':
      ensure  => 'present',
      extract => false,
      source  => 's3://nh-storage/virtualbox-6.0_6.0.8-130520_Ubuntu_bionic_amd64.deb',
      require => File['/var/tmp/nhdata'],
    }
  }

  elsif $::osfamily == 'Windows' {

    # Place the extension Pack
    archive { 'C:\\nhdata\\Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack':
      ensure  => 'present',
      extract => false,
      source  => 's3://nh-storage/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack',
      require => File['C:\\nhdata'],
    }

    # Place the Virtualbox Installer
    archive { 'C:\\nhdata\\VirtualBox-6.0.8-130520-Win.exe':
      ensure  => 'present',
      extract => false,
      source  => 's3://nh-storage/VirtualBox-6.0.8-130520-Win.exe',
      require => File['C:\\nhdata'],
    }
  }

  elsif $::osfamily == 'RedHat' {

    # Place the extenstion pack
    archive { '/var/tmp/nhdata/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack':
      ensure  => 'present',
      extract => false,
      source  => 's3://nh-storage/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack',
      require => File['/var/tmp/nhdata'],
    }

    # Place the Virtualbox installer
    archive { '/var/tmp/nhdata/VirtualBox-6.0-6.0.8_130520_el7-1.x86_64.rpm':
      ensure  => 'present',
      extract => false,
      source  => 's3://nh-storage/VirtualBox-6.0-6.0.8_130520_el7-1.x86_64.rpm',
      require => File['/var/tmp/nhdata'],
    }
  }
}
