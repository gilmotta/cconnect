# Manifest to manage the installation of the provided gems
class cconnect::geminstall {

  # Install Gems on Linux
  if $facts['os']['name'] == 'Linux' {
    # Install the Colorize Gem
    package { 'colorize':
      ensure   => 'installed',
      provider => 'gem',
      source   => '/tmp/nhdata/colorize-0.8.1.gem',
      require  => File['/tmp/nhdata/colorize-0.8.1.gem'],
    }

    # Install the JSON gem
    package { 'json':
      ensure   => 'installed',
      provider => 'gem',
      source   => '/tmp/nhdata/json-2.2.0.gem',
      require  => File['/tmp/nhdata/json-2.2.0.gem'],
    }
  }

  if $facts['os']['name'] == 'Windows' {
    # Install the colorize Gem
    package { 'colorize':
      ensure   => 'installed',
      provider => 'gem',
      source   => 'C:/nhdata/colorize-0.8.1.gem',
    }

    # Install the JSON Gem
    package { 'json':
      ensure   => 'installed',
      provider => 'gem',
      source   => 'C:/nhdata/json-2.2.0.gem',
    }
  }
}
