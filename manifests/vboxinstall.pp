# Manifest to perform the installation of the Virtualbox Package
class cconnect::vboxinstall {

  if $::osfamily == 'Debian' {
    # Install Debian Virtualbox Package on node
    package { 'virtualbox':
      ensure   => 'installed',
      provider => 'dpkg',
      source   => '/var/tmp/nhdata/virtualbox-6.0_6.0.8-130520_Ubuntu_bionic_amd64.deb',
      require  => Archive['/var/tmp/nhdata/virtualbox-6.0_6.0.8-130520_Ubuntu_bionic_amd64.deb'],
    }
  }

  if $::osfamily == 'Windows' {
    # Install Windows Virtualbox Package on node
    package { 'Virtualbox':
      ensure   => 'installed',
      provider => 'windows',
      source   => 'C:/nhdata/VirtualBox-6.0.8-130520-Win.exe',
      require  => Archive['C:/nhdata/VirtualBox-6.0.8-130520-Win.exe'],
    }
  }

  if $::osfamily == 'RedHat' {
    # Install RedHat/CentOS Virtualbox Package on node
    package { 'virtualbox':
      ensure   => 'installed',
      provider => 'rpm',
      source   => '/var/tmp/nhdata/VirtualBox-6.0-6.0.8_130520_el7-1.x86_64.rpm',
      require  => Archive['/var/tmp/nhdata/VirtualBox-6.0-6.0.8_130520_el7-1.x86_64.rpm'],
    }
  }
}
