# Main Module Entry Point
class cconnect {

  include cconnect::fileprep
  include cconnect::vboxprep
  include cconnect::geminstall
  include cconnect::vboxinstall

  Class['cconnect::fileprep']
  ->Class['cconnect::vboxprep']
  ->Class['cconnect::geminstall']
  ->Class['cconnect::vboxinstall']

}
